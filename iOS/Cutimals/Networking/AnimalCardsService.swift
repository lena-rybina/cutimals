//
//  AnimalCardsService.swift
//  Cutimals
//
//  Created by Elena Rybina on 3/29/21.
//

import Foundation

enum AnimalCardsServiceError: Error {
    case missingData
}

class AnimalCardsService {
    class func getAnimalCard(completed: @escaping (Result<AnimalCards, Error>)-> ()) {
        
        let bundle = Bundle.main
        /// With resource for given path
        let dataPath = bundle.path(forResource: "animals",
                                   ofType: "json")!
        
        /// Get data
        let data = try! Data(contentsOf: URL(fileURLWithPath: dataPath))
        
        /// Try to decode
        do {
            let decoder = JSONDecoder()
            let cards = try decoder.decode(AnimalCards.self,
                                             from: data)
        //    print("Title: ", cards.name)
            completed(.success(cards))
            
        } catch let error {
            completed(.failure(error))
        }
    }
}
