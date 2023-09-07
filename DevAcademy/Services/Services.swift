//
//  Services.swift
//  DevAcademy
//
//  Created by Zdenko Čepan on 09/08/2023.
//

import Foundation

final class Services {
    let placeService: PlacesService
    let userLocationService: UserLocationService

    init(
        placeService: PlacesService,
        userLocationService: UserLocationService
    ) {
        self.placeService = placeService
        self.userLocationService = userLocationService
    }
}

extension Services {
    convenience init() {
        let placesService = ProductionPlacesService()
        let userLocationService = ProductionUserLocationService()

        self.init(
            placeService: placesService,
            userLocationService: userLocationService
        )
    }
}

// MARK: - Mocks
extension Services {
    static let mock = Services(
        placeService: MockPlacesService(),
        userLocationService: MockLocationService()
    )
}
