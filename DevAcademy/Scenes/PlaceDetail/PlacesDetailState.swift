//
//  PlacesDetailState.swift
//  DevAcademy
//
//  Created by Zdenko Čepan on 08/08/2023.
//

import SwiftUI

struct PlacesDetailState: DynamicProperty {
    @EnvironmentObject var placesObject: PlacesObservableObject
    let feature: Feature
    //@Binding var favorites: [Int]
    @State var isFav: Bool
    @State var isPresentingMap: Bool = false
    
    var url: URL? {
        guard let obrId1 = feature.properties.obrId1, let url = URL(string: obrId1) else {
            return nil
        }
        return url
    }
    
    var geometry: Point {
        feature.geometry!
    }
    
    var name: String {
        feature.properties.title
    }
    
    var type: String {
        feature.properties.kind.rawValue
    }
    
    var id: Int {
        feature.properties.ogcFid
    }
    
    var phone: String {
        feature.properties.phone ?? ""
    }
    
    var email: String {
        feature.properties.email ?? ""
    }
    
    var street: String {
        feature.properties.street ?? ""
    }
    
    var cpCo: String {
        feature.properties.cpCo ?? ""
    }
    
    var program: String {
        feature.properties.program ?? ""
    }
    
    var web: String {
        feature.properties.web ?? ""
    }
    
    func favoritToggle() -> Void {
        isFav.toggle()
        placesObject.updateFeatures(feature: id, append: isFav)
    }
}
