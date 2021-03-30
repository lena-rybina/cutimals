//
//  AnimalCardsViewModel.swift
//  Cutimals
//
//  Created by Elena Rybina on 3/29/21.
//

import Foundation

class AnimalCardsViewModel {
    let model: CutimalsModel
    
    init(model: CutimalsModel) {
        self.model = model
    }
    func fetchRows(completed: @escaping (Result<[CutimalsRows], Error>)->()) {
        model.fetchAnimalCardsandMapToRows(completed: completed)
    }
}
