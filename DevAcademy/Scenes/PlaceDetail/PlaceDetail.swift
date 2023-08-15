//
//  PlaceDetail.swift
//  DevAcademy
//
//  Created by Zdenko Čepan on 01/08/2023.
//

import SwiftUI

struct PlaceDetail: View {
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
                }
                Text(state.name)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                Text(state.type)
                    .foregroundColor(.secondary)
                    .font(.title2)
                
                Spacer()
            } // VSTACK
            
            Image(systemName: state.isFav ? "heart.fill" : "heart")
                .resizable()
                .frame(width: 80, height: 80)
                .padding()
                .onTapGesture {
                    state.isFav.toggle()
                   // if state.isFav { state.favorites.append(state.id)
                   // } else {
                   //     state.favorites = state.favorites.filter { $0 != state.id }
                   // }
                }
        } // ZSTACK
    }
}

struct PlaceDetail_Previews: PreviewProvider {
    static var previews: some View {
        PlaceDetail(state: PlacesDetailState(feature: Features.mock.features[0], favorites: [], isFav: false))
    }
}

