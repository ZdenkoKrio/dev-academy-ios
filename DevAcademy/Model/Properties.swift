//
//  Properties.swift
//  DevAcademy
//
//  Created by Zdenko Čepan on 18/07/2023.
//

import Foundation

struct Properties: Decodable {
    let ogcFid: Int
    let obrId1: String?
    let kind: PossibleKind
    let title: String
    let web: String?
    let program: String?  // url
    let street: String?
    let cpCo: String?
    let email: String?
    let phone: String?
    
    enum CodingKeys: String, CodingKey {
        case ogcFid = "ogc_fid"
        case obrId1 = "obr_id1"
        case title = "nazev"
        case kind = "druh"
        case street = "ulice"
        case cpCo = "cp_co"
        case phone = "telefon"
        case web
        case program
        case email
    }
}
