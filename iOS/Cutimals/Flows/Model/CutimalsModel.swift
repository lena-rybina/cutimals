//
//  CutimalsModel.swift
//  Cutimals
//
//  Created by Elena Rybina on 3/29/21.
//

import Foundation

class CutimalsModel {
   
    /// Fetching profile and mapping to rows
    func fetchAnimalCardsandMapToRows(completed: @escaping (Result<[CutimalsRows], Error>)->()) {
        AnimalCardsService.getAnimalCard(completed: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let animalCards):
                let processedRows = self.processAnimalCardsToRows(animalCards)
                completed(.success(processedRows))
            case.failure(let error):
                completed(.failure(error))
            }
        })
    }
        /// Map profile to rows
    private func processAnimalCardsToRows(_ animalCards: AnimalCards)-> [CutimalsRows] {
        /// Flat data structure, 1 dimentional array
        var result: [CutimalsRows] = [.animalImage(animalCards.imageURL),
                                      .name(animalCards.name),
                                      .details(animalCards.detailsSmall)]
        return result
    }
        
        }
