//
//  PlaceRowState.swift
//  DevAcademy
//
//  Created by Zdenko Čepan on 08/08/2023.
//

import SwiftUI

struct PlacesRowState: DynamicProperty {
    let feature: Feature
    
    var url: URL {
        feature.properties.obrId1
    }
    
    var name: String {
        feature.properties.nazev
    }
    
    var type: String {
        feature.properties.druh.rawValue
    }
}
