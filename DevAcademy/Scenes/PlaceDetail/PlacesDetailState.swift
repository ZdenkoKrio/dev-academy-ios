//
//  PlacesDetailState.swift
//  DevAcademy
//
//  Created by Zdenko Čepan on 08/08/2023.
//

import SwiftUI

struct PlacesDetailState: DynamicProperty {
    let feature: Feature
    var favorites: [Int]
    @State var isFav: Bool
    
    var url: URL {
        feature.properties.obrId1
    }
    
    var name: String {
        feature.properties.nazev
    }
    
    var type: String {
        feature.properties.druh.rawValue
    }
    
    var id: Int {
        feature.properties.ogcFid
    }
}
