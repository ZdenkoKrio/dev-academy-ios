//
//  PossibleKind.swift
//  DevAcademy
//
//  Created by Zdenko Čepan on 18/07/2023.
//

import Foundation

enum PossibleKind: RawRepresentable {
    init?(rawValue: String) {
        guard let n = Kind(rawValue: rawValue) else {
            self = .unknown(rawValue)
            return
        }
        self = .kind(n)
    }
    
    var rawValue: String {
        switch self {
        case .kind(let n):
            return n.rawValue
        case .unknown(let string):
            return string
        }
    }
    
    case kind(Kind)
    case unknown(String)
}
