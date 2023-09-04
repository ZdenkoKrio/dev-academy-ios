//
//  Feature.swift
//  DevAcademy
//
//  Created by Zdenko Čepan on 18/07/2023.
//

import Foundation

struct Features: Decodable {
    let features: [Feature]
}


extension Features {
    static let mock: Features = Features(
        features: [
            Feature(
                geometry: Point(latitude: 49.1913, longitude: 16.6115),
                properties: Properties(
                    ogcFid: 1,
                    obrId1: "https://picsum.photos/200",
                    kind: .kind(.theatre),
                    title: "Národní divadlo Brno",
                    web: "https://picsum.photos/200",
                    program: "https://picsum.photos/200",
                    street: "Svobody",
                    cpCo: "100/24",
                    email: "mail@gmail.com",
                    phone: "09123123123"
                )
            ),
            
            Feature(
                geometry: Point(latitude: 49.1914, longitude: 16.6126),
                properties: Properties(
                    ogcFid: 7,
                    obrId1: "https://picsum.photos/200",
                    kind: .kind(.concertHall),
                    title: "Janáčkovo divadlo",
                    web: "https://picsum.photos/200",
                    program: "https://picsum.photos/200",
                    street: "Svobody",
                    cpCo: "100/24",
                    email: "mail@gmail.com",
                    phone: "09123123123"
                )
            ),
            Feature(
                geometry: Point(latitude: 49.2182, longitude: 16.5893),
                properties: Properties(
                    ogcFid: 8,
                    obrId1: "https://picsum.photos/200",
                    kind: .kind(.cultureSight),
                    title: "Špilberk Brno",
                    web: "https://picsum.photos/200",
                    program: "https://picsum.photos/200",
                    street: "Svobody",
                    cpCo: "100/24",
                    email: "mail@gmail.com",
                    phone: "09123123123"
                )
            ),
            Feature(
                geometry: Point(latitude: 49.1925, longitude: 16.6112),
                properties: Properties(
                    ogcFid: 15,
                    obrId1: "https://picsum.photos/200",
                    kind: .kind(.exhibitionCenter),
                    title: "Brněnské výstaviště",
                    web: "https://picsum.photos/200",
                    program: "https://picsum.photos/200",
                    street: "Svobody",
                    cpCo: "100/24",
                    email: "mail@gmail.com",
                    phone: "09123123123"
                )
            )
        ]
    )
}
