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
    
    func placesDetail(with feature: Feature, isFav: Bool) -> some View {
        PlaceDetail(state: PlacesDetailState(feature: feature, isFav: isFav))
    }
    
    func mapScene(coor: Point) -> some View {
        MapDetailScene(state: MapDetailSceneState(point: coor))
            .presentationDetents([.large])
            .presentationDragIndicator(.visible)
    }
    
    func favoriteScene(state: FavoritesSceneState) -> some View {
        FavoritesScene(state: state)
            .presentationDetents([.large])
            .presentationDragIndicator(.visible)
    }
}
