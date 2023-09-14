//
//  PlacesSceneState.swift
//  DevAcademy
//
//  Created by Zdenko Čepan on 08/08/2023.
//

import SwiftUI

struct PlacesSceneState: DynamicProperty{
    @EnvironmentObject private var placesObject: PlacesObservableObject
    
    @State var showFavorites: Bool = false
    
    var features: [Feature] {
        placesObject.features
    }
    
    var isLoaded: Bool {
        !features.isEmpty
    }
    
    func isFavorit(feature: Feature) -> Bool {
        guard let favorites = placesObject.favouriteFeatures else {
            return false
        }
        return favorites.contains(feature.properties.ogcFid)
    }
    
    func fetch() async {
       await placesObject.loadData()
    }
    
    func favoritesPressed() {
        showFavorites.toggle()
    }
    
    func onFeatureTapped(feature: Feature) {
        placesObject.features.removeAll(where: {$0.properties.ogcFid == feature.properties.ogcFid})
    }
    
    func getFavoritesRows() -> [Feature] {
        guard let favorites = placesObject.favouriteFeatures else {
            return []
        }
        return features.filter{ favorites.contains($0.properties.ogcFid) }
    }
}
