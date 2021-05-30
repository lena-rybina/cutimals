//
//  CutimalsRows.swift
//  Cutimals
//
//  Created by Elena Rybina on 3/29/21.
//

import Foundation

struct CutimalsRows {
    let animalImage: URL?
    let name: String
    let details: String
}

enum DetailRow {
    case image(URL)
    case titleDetail(String, String)
}
