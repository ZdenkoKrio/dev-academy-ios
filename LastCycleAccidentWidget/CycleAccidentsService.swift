//
//  CycleAccidentsService.swift
//  DevAcademy
//
//  Created by Zdenko Čepan on 28.08.2023.
//

import Foundation

protocol CycleAccidentsService {
    func accidents() async throws -> Accidents
    
    func lastAccident() async throws -> Accident
}


class ProductionCycleAccidentsService: CycleAccidentsService {
    func accidents() async throws -> Accidents {
        let session = URLSession.shared
        let url = URL(string: "https://gis.brno.cz/ags1/rest/services/Hosted/Cyklo_nehody/FeatureServer/0/query?where=1%3D1&outFields=*&outSR=4326&f=json")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let (data, _) = try await session.data(for: request)
        return try JSONDecoder().decode(Accidents.self, from: data)
    }
    
    func lastAccident() async throws -> Accident {
        return try await accidents().accidents.last ?? Accidents.mock.accidents[0]
    }
}


class MockCycleAccidentsService: CycleAccidentsService {
    func accidents() async throws -> Accidents {
        return Accidents.mock
    }
    
    func lastAccident() async throws -> Accident {
        Accidents.mock.accidents[1]
    }
}
