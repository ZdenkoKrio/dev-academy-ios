//
//  PlacesRow.swift
//  DevAcademy
//
//  Created by Zdenko Čepan on 25/07/2023.
//

import SwiftUI

struct PlacesRow: View {
    let state: PlacesRowState
    
    var body: some View {
        HStack {
            AsyncImage(url: state.url) {
                image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .shadow(radius: 4
                    )
            } placeholder: {
                ProgressView()
            }
            VStack(alignment: .leading) {
                Text(state.feature.properties.nazev)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                Text(state.type)
                    .foregroundColor(.secondary)
                    .font(.subheadline)
            } // VSTACK
        } // HSTACK
    }
}

struct PlacesRow_Previews: PreviewProvider {
    static var previews: some View {
        PlacesRow(state: PlacesRowState(feature: Features.mock.features[0]))
    }
}
