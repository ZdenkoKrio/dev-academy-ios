//
//  PlacesObservableObject.swift
//  DevAcademy
//
//  Created by Zdenko Čepan on 08/08/2023.
//

import Foundation

final class PlacesObservableObject: ObservableObject {
    @Published var features: [Feature] = []
    
    private let placeService: PlacesService = ProductionPlacesService()
    
    @MainActor
    func loadData() async {
        do {
            features = try await placeService.places().features
        } catch {
            print("Some Error: \(error)")
        }
    }
}
