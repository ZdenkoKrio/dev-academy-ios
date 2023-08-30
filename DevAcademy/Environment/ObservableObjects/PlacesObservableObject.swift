//
//  PlacesObservableObject.swift
//  DevAcademy
//
//  Created by Zdenko Čepan on 08/08/2023.
//

import Foundation
import SwiftUI

final class PlacesObservableObject: ObservableObject {
    @Published var features: [Feature] = []
    var rawFeatures: [Feature] = []
    
    private(set) var favouriteFeatures: [Int]? {
        get {
            UserDefaults.standard.array(forKey: "my.storage.favourites") as? [Int]
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "my.storage.favourites")
        }
    }
    
    private let placeService: PlacesService = ProductionPlacesService()
    
    @MainActor
    func loadData() async {
        do {
            features = try await placeService.places().features
            rawFeatures = features
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
}
