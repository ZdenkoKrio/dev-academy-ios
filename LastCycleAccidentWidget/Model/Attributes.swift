//
//  Attributes.swift
//  DevAcademy
//
//  Created by Zdenko Čepan on 28.08.2023.
//

import Foundation

struct Attributes: Decodable {
    let impact: String
    let alcohol: String
    let ageGroup: String
    let day: String
    let trespasser: String
    
    enum CodingKeys: String, CodingKey {
        case impact = "nasledek"
        case alcohol = "alkohol"
        case ageGroup = "vek_skupina"
        case day = "den_v_tydnu"
        case trespasser = "zavineni"
    }
}
