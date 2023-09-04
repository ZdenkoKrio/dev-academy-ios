//
//  Kind.swift
//  DevAcademy
//
//  Created by Zdenko Čepan on 18/07/2023.
//

import Foundation

enum Kind: String, Decodable {
    case theatre = "Divadlo"
    case gallery = "Galerie"
    case hub = "Hub"
    case musicClub = "Hudebni klub"
    case cinema = "Kino"
    case library = "Knihovna"
    case concertHall = "Koncertní hala"
    case cultureCenter = "Kulturní centrum"
    case cultureSight = "Kulturní památka"
    case summerCinema = "Letní kino"
    case museum = "Muzeum"
    case cultureProgram = "Podnik s kulturním programem"
    case exhibitionCenter = "Výstaviště"
    case other = "Ostatní"
}
