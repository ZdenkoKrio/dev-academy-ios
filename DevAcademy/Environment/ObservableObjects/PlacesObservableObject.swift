//
//  PlacesObservableObject.swift
//  DevAcademy
//
//  Created by Zdenko Čepan on 08/08/2023.
//

import Foundation

final class PlacesObservableObject: ObservableObject {
    @Published var features: [Feature] = []
    
    private let dataService: DataService = DataService.shared
    
    func loadData() {
        dataService.fetchData{ result in
            switch result {
            case .success(let features):
                self.features = features.features
            case .failure(let error):
                print(error)
            } // SWITCH
        } // DATA_SERVICE
    }
}
