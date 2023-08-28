//
//  Accidents.swift
//  DevAcademy
//
//  Created by Zdenko Čepan on 28.08.2023.
//

import Foundation

struct Accidents: Decodable {
    let accidents: [Accident]
}

extension Accidents {
    static let mock: Accidents = Accidents(accidents: [
        Accident(attributes: Attributes(impact: "Error 404",
                                        alcohol: "Error 404",
                                        ageGroup: "Error 404",
                                        day: "Error 404",
                                        trespasser: "Error 404"),
                 geometry: WidgetPoint(latitude: 0, longitude: 0)),
        Accident(attributes: Attributes(impact: "nehoda s následky na životě nebo zdraví",
                                        alcohol: "Ne",
                                        ageGroup: "18-25",
                                        day: "nedele",
                                        trespasser: "cyklista"),
                 geometry: WidgetPoint(latitude: 49.207535792779346, longitude: 16.623836769572115))
    ])
}
