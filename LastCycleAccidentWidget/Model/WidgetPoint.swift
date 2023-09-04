//
//  Geometry.swift
//  DevAcademy
//
//  Created by Zdenko Čepan on 28.08.2023.
//

import Foundation

struct WidgetPoint: Decodable {
    let latitude: Double
    let longitude: Double
    
    enum CodingKeys: String, CodingKey {
        case latitude = "y"
        case longitude = "x"
    }
}
