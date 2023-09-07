//
//  ObservableObjects.swift
//  DevAcademy
//
//  Created by Zdenko Čepan on 09/08/2023.
//

import Foundation

// MARK: - ObservableObjects
final class ObservableObjects {
    let features: PlacesObservableObject

    init(
        features: PlacesObservableObject
    ) {
        self.features = features
    }
}

// MARK: - ObservableObjects + Extension
extension ObservableObjects {
    convenience init(services: Services) {
        let features = PlacesObservableObject(locationService: services.userLocationService)

        self.init(
            features: features
        )
    }
}

// MARK: - Mocks
extension ObservableObjects {
    static let mock: ObservableObjects = ObservableObjects(services: .mock)
}
