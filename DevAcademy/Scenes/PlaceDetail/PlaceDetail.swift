//
//  PlaceDetail.swift
//  DevAcademy
//
//  Created by Zdenko Čepan on 01/08/2023.
//

import SwiftUI

struct PlaceDetail: View {
    @EnvironmentObject var coordinator: Coordinator
    let state: PlacesDetailState
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack {
                AsyncImage(url: state.url) {
                    image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 360, height: 360)
                        .clipShape(Circle())
                        .shadow(radius: 4
                        )
                } placeholder: {
                    ProgressView()
                } // ASYNC
                
                Text(state.name)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                Text(state.type)
                    .foregroundColor(.secondary)
                    .font(.title2)
                Group {
                    Link("Program ", destination: (URL(string: state.program)!))
                        .font(.headline)
                    HStack {
                        Text("Web: ")
                        Link("\(state.web) ", destination: URL(string: state.web)!)  // WTF ERROR without !
                    } // HSTACK
                    
                    Text("Adress: \(state.street) \(state.cpCo)")
                    Text("Email: \(state.email)")
                    Text("Phone: \(state.phone)")
                } // GROUP
                
                Spacer()
                
                Button("Show map") {
                    state.isPresentingMap.toggle()
                } // BUTTON
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: 150, height: 40)
                .background(.blue)
                .cornerRadius(15)
                .shadow(radius: 25)
                .padding()
                
                Spacer()
            } // VSTACK
            
            Image(systemName: state.isFav ? "heart.fill" : "heart")
                .resizable()
                .frame(width: 80, height: 80)
                .padding()
                .onTapGesture {
                    state.favoritToggle()
                }
        } // ZSTACK
        .sheet(isPresented: state.$isPresentingMap) {
            coordinator.mapScene(coor: state.geometry)
        } // SHEET
    }
}

struct PlaceDetail_Previews: PreviewProvider {
    static var previews: some View {
        PlaceDetail(state: PlacesDetailState(feature: Features.mock.features[0], favorites: .constant([]), isFav: false))
    }
}

