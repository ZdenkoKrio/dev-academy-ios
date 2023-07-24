//
//  DataService.swift
//  DevAcademy
//
//  Created by Zdenko Čepan on 18/07/2023.
//

import Foundation


class DataService {
    var data: Result<Features, Error>?
    
    static let shared = DataService.init()
    
    private init() {
        
    }
    
    func fetchData(_ n: @escaping (Result<Features, Error>) -> Void) -> Void {
        if data != nil {
            n(data!)
            return
        }
        
        let timer = Timer.scheduledTimer(withTimeInterval: 10, repeats: false)
        { [weak self] _ in
            let data = Result<Features, Error>.success(DataService.mockData)
            self?.data = data
            n(data)
        }
    }
}


extension DataService {
    private static var mockData: Features = Features(features: [])
}
