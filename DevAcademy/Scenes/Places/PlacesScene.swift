//
//  Places.swift
//  DevAcademy
//
//  Created by Zdenko Čepan on 25/07/2023.
//

import SwiftUI

struct PlacesScene: View {
    @State var features: [Feature] = []
    
    var body: some View {
        NavigationStack {
            Group {
                if !features.isEmpty {
                    List(features, id: \.properties.ogcFid) { feature in
                        PlacesRow(feature: feature)
                            .onTapGesture {
                                onFeatureTapped(feature: feature)
                            }
                    } // LIST
                    .listStyle(.plain)
                    .animation(.default, value: features)
                } else {
                    ProgressView()
                } // ELSE
            } // GROUP
            .navigationTitle("Kulturmapa")
        } // NAVIGATION
        .onAppear(perform: fetch)
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
