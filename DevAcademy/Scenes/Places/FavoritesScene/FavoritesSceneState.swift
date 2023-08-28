//
//  FavoritesSceneState.swift
//  DevAcademy
//
//  Created by Zdenko Čepan on 28/08/2023.
//

import SwiftUI

struct FavoritesSceneState: DynamicProperty {
    @Binding var favorites: [Int]
    let features: [Feature]
    
    var isFavoritesEmpty: Bool {
        getFavoritesRows().isEmpty
    }
    
    func isFavorit(feature: Feature) -> Bool {
        favorites.contains(feature.properties.ogcFid)
    }
    
    func getFavoritesRows() -> [Feature] {
        features.filter{ favorites.contains($0.properties.ogcFid) }
    }
}
