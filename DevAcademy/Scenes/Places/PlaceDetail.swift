//
//  PlaceDetail.swift
//  DevAcademy
//
//  Created by Zdenko Čepan on 01/08/2023.
//

import SwiftUI

struct PlaceDetail: View {
    let feature: Feature
    @Binding var favorities: [Int]
    @State var isFav: Bool
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack {
                AsyncImage(url: feature.properties.obrId1) {
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
                Text(feature.properties.nazev)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                Text(feature.properties.druh.rawValue)
                    .foregroundColor(.secondary)
                    .font(.title2)
                
                Spacer()
            } // VSTACK
            
            Image(systemName: isFav ? "heart.fill" : "heart")
                .resizable()
                .frame(width: 80, height: 80)
                .padding()
                .onTapGesture {
                    isFav.toggle()
                    if isFav { favorities.append(feature.properties.ogcFid)
                    } else {
                        favorities = favorities.filter { $0 != feature.properties.ogcFid }
                    }
                }
        } // ZSTACK
    }
}

struct PlaceDetail_Previews: PreviewProvider {
    static var previews: some View {
        PlaceDetail(feature: Features.mock.features[0], favorities: .constant([]), isFav: false)
    }
}

