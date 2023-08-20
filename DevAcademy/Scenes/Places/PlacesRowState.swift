//
//  PlaceRowState.swift
//  DevAcademy
//
//  Created by Zdenko Čepan on 08/08/2023.
//

import SwiftUI

struct PlacesRowState: DynamicProperty {
    let feature: Feature
    
    var url: URL? {
        guard let obrId1 = feature.properties.obrId1, let url = URL(string: obrId1) else {
            return nil
        }
        return url
    }
    
    var name: String {
        feature.properties.title
    }
    
    var type: String {
        feature.properties.kind.rawValue
    }
}
