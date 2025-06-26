//
//  PokemonDTOs.swift
//  CleanArchitectureStudy
//
//  Created by 장은석 on 6/26/25.
//

import Foundation

struct PokemonCardDTO: Decodable {
    
    let id: String
    let name: String
    let supertype: String
    let types: [String]
    let images: ImagesDTO
    let set: SetDTO

    struct ImagesDTO: Decodable {
        let small: String
        let large: String
    }
    struct SetDTO: Decodable {
        let id: String
        let name: String
    }
}

struct CardsResponseDTO: Decodable {
    
    let data: [PokemonCardDTO]
    let page: Int
    let pageSize: Int
    let count: Int
    let totalCount: Int
}

extension PokemonCardDTO {
    
    func toDomain() -> PokemonCard {
        return .init(
            id: id,
            name: name,
            supertype: supertype,
            types: types,
            imageSmallURL: URL(string: images.small)!,
            imageLargeURL: URL(string: images.large)!,
            setID: set.id,
            setName: set.name
        )
    }
}
