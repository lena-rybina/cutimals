//
//  AnimalCards.swift
//  Cutimals
//
//  Created by Elena Rybina on 3/29/21.
//

import Foundation

struct AnimalCards: Codable {
    let id: String
    let name: String
    private let imageURLString: String
    var imageURL: URL? {
        URL(string: imageURLString)
    }
    let detailsSmall: String
    let speed: Int?
    let lifespanMin: Int?
    let lifespanMax: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case imageURLString = "image_url"
        case detailsSmall = "details_small"
        case speed
        case lifespanMin = "lifespan_min"
        case lifespanMax = "lifespan_max"
    }
}
