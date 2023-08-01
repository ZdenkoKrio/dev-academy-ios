//
//  Places.swift
//  DevAcademy
//
//  Created by Zdenko Čepan on 25/07/2023.
//

import SwiftUI
import ActivityIndicatorView

struct PlacesScene: View {
    @State var features: [Feature] = []
    @State var showFavorites: Bool = false
    @State var favorites: [Int] = []
    
    var body: some View {
        NavigationStack {
            Group {
                if !features.isEmpty {
                    List(features, id: \.properties.ogcFid) { feature in
                        NavigationLink(destination: PlaceDetail(feature: feature, favorities: $favorites, isFav: favorites.contains(feature.properties.ogcFid))) {
                            PlacesRow(feature: feature)
                                .onTapGesture {
                                    onFeatureTapped(feature: feature)
                                }
                        } // LINK
                    } // LIST
                    .listStyle(.plain)
                    .animation(.default, value: features)
                } else {
                    ActivityIndicatorView(isVisible: .constant(true),
                    type: .growingCircle)
                } // ELSE
            } // GROUP
            .navigationTitle("Kulturmapa")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button(action: {showFavorites = true}) {
                        Label("", systemImage: "heart.fill")
                            .foregroundColor(.black)
                    } // BUTTON
                } // TOOLBAR ITEM
                    } // TOOLBAR
        } // NAVIGATION
        .onAppear(perform: fetch)
        .sheet(isPresented: $showFavorites) {
            Text("Zatím tady nic neni.")
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.visible)
        }
        
    }
    
    func onFeatureTapped(feature: Feature) {
        features.removeAll(where: {$0.properties.ogcFid == feature.properties.ogcFid})
    }
    
    func fetch() {
        DataService.shared.fetchData{ result in
            switch result {
            case .success(let features):
                self.features = features.features
            case .failure(let error):
                print(error)
            } // SWITCH
        } // DATA_SERVICE
    }
}

struct Places_Previews: PreviewProvider {
    static var previews: some View {
        PlacesScene()
    }
}
