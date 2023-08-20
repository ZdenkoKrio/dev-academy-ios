//
//  Services.swift
//  DevAcademy
//
//  Created by Zdenko Čepan on 09/08/2023.
//

import Foundation

final class Services {
    let placeService: PlacesService

    init(
        placeService: PlacesService
    ) {
        self.placeService = placeService
    }
}

extension Services {
    convenience init() {
        let placesService = ProductionPlacesService()

        self.init(
            placeService: placesService
        )
    }
}

// MARK: - Mocks
extension Services {
    static let mock = Services(
        placeService: MockPlacesService()
    )
}
