//
//  PlacesObservableObject.swift
//  DevAcademy
//
//  Created by Zdenko Čepan on 08/08/2023.
//

import Foundation
import SwiftUI
import CoreLocation

final class PlacesObservableObject: ObservableObject {
    @Published var features: [Feature] = []
    
    private(set) var favouriteFeatures: [Int]? {
        get {
            UserDefaults.standard.array(forKey: "my.storage.favourites") as? [Int]
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "my.storage.favourites")
            updatePlaces()
        }
    }
    
    private var rawPlaces: [Feature] = [] {
        didSet {
            updatePlaces()
        }
    }
    
    private let placeService: PlacesService = ProductionPlacesService()
    private let locationService: UserLocationService
    private var lastUpdatedLocation: CLLocation?
    
    init(locationService: UserLocationService) {
        self.locationService = locationService
        
        self.locationService.listenDidUpdateLocation { [weak self] location in
            DispatchQueue.main.async {
                guard let userLocation = location.first, ((self?.shouldUpdate(location: userLocation)) != nil) else { return }
                self?.lastUpdatedLocation = userLocation
                self?.updatePlaces()
            }
        }
                
        self.locationService.listenDidUpdateStatus { [weak self] status in
            switch status {
            case .notDetermined:
                self?.locationService.requestAuthorization()
            
            case .authorizedWhenInUse, .authorizedAlways:
                self?.beginLocationUpdates()
            
            default:
                break
            }
        }
    }
    
    @MainActor
    func loadData() async {
        do {
            rawPlaces = try await placeService.places().features
        } catch {
            print("Some Error: \(error)")
        }
    }
    
    func updateFeatures(feature: Int, append: Bool) {
        var favourites = favouriteFeatures ?? []
        if append {
            favourites.append(feature)
            favouriteFeatures = favourites
        } else {
            favourites = favourites.filter { $0 != feature }
            favouriteFeatures = favourites
        }
    }
    
    func updatePlaces() {
        var regularPlaces = rawPlaces
                
                if let lastUpdatedLocation {
                    regularPlaces.sort { lPlace, rPlace in
                        guard let rPoint = rPlace.geometry?.cllocation else {
                            return false
                        }
                        guard let lPoint = lPlace.geometry?.cllocation else {
                            return true
                        }

                        return lastUpdatedLocation.distance(from: lPoint).magnitude < lastUpdatedLocation.distance(from: rPoint).magnitude
                    }
                }
        self.features = regularPlaces
    }
    
    func beginLocationUpdates() {
        self.locationService.startUpdatingLocation()
    }
    
    func shouldUpdate(location: CLLocation) -> Bool {
        lastUpdatedLocation.flatMap{
            $0.distance(from: location).magnitude > 300
        } ?? true
    }
}
