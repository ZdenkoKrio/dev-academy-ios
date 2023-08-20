//
//  Point.swift
//  DevAcademy
//
//  Created by Zdenko Čepan on 18/07/2023.
//

import Foundation

struct Point: Decodable {
    let latitude: Double
    let longitude: Double
    
    enum CodingKeys: String, CodingKey {
        case latitude = "x"
        case longitude = "y"
    }
}
