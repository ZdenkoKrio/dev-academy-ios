//
//  MapDetailScene.swift
//  DevAcademy
//
//  Created by Zdenko Čepan on 28/08/2023.
//

import SwiftUI
import MapKit

struct MapDetailScene: View {
    let state: MapDetailSceneState
    
    var body: some View {
        Map(coordinateRegion: .constant(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: state.lat, longitude: state.long), span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))), interactionModes: [])
    }
}

struct MapDetailScene_Previews: PreviewProvider {
    static var previews: some View {
        MapDetailScene(state: MapDetailSceneState(point: Features.mock.features[0].geometry!))
    }
}
