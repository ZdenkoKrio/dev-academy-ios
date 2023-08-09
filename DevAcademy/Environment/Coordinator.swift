//
//  Coordinator.swift
//  DevAcademy
//
//  Created by Zdenko Čepan on 08/08/2023.
//

import SwiftUI


final class Coordinator: ObservableObject {
    
    var placesScene: some View {
        PlacesScene()
    }
    
    func placesDetail(with feature: Feature, favorites: [Int], isFav: Bool) -> some View {
        PlaceDetail(state: PlacesDetailState(feature: feature, favorites: favorites, isFav: isFav))
    }
    
    var favoriteScene: some View {
        Text("Zatím tady nic není")
    }
}
