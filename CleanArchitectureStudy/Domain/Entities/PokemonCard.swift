//
//  PokemonCard.swift
//  CleanArchitectureStudy
//
//  Created by 장은석 on 6/26/25.
//

import Foundation

public struct PokemonCard: Identifiable, Equatable {
    public let id: String
    public let name: String
    public let supertype: String
    public let types: [String]
    public let imageSmallURL: URL
    public let imageLargeURL: URL
    public let setID: String
    public let setName: String
    public var isFavorite: Bool = false
}
