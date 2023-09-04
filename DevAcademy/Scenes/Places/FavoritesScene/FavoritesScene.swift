//
//  FavoritesScene.swift
//  DevAcademy
//
//  Created by Zdenko Čepan on 28/08/2023.
//

import SwiftUI

struct FavoritesScene: View {
    @EnvironmentObject var coordinator: Coordinator
    let state: FavoritesSceneState
    
    var body: some View {
        NavigationStack {
            Group {
                if !state.isFavoritesEmpty {
                    List(state.getFavoritesRows(), id: \.properties.ogcFid) { row in
                        NavigationLink(destination: coordinator.placesDetail(with: row, favorites: state.$favorites, isFav: state.isFavorit(feature: row))) {
                            PlacesRow(state: PlacesRowState(feature: row))
                        } // LINK
                    } // LIST
                    .listStyle(.plain)
                    .animation(.default, value: state.features)
                } else {
                    Text("You dont have aby favorit.")
                } // ELSE
            } // GROUP
            .navigationTitle("Favorites")
            .navigationBarTitleDisplayMode(.automatic)
        } // NAVIGATION
    }
}

struct FavoritesScene_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesScene(state: FavoritesSceneState(favorites: .constant([]), features: []))
    }
}
