//
//  MapDetailSceneState.swift
//  DevAcademy
//
//  Created by Zdenko Čepan on 28/08/2023.
//

import SwiftUI

struct MapDetailSceneState: DynamicProperty {
    let point: Point
    
    var long: Double {
        point.longitude
    }
    
    var lat: Double {
        point.latitude
    }
}

