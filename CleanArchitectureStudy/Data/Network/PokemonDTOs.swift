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
    let types: [String]?
    let images: ImageURLs
    let setInfo: SetInfo

    struct ImageURLs: Decodable {
      let small: URL
      let large: URL
    }
}

struct SetInfo: Decodable, Equatable {
  let images: SetImages
}

struct SetImages: Decodable, Equatable {
  let symbol: URL
  let logo: URL
}

struct PokemonCardsResponseDTO: Decodable {
    
    let data: [PokemonCardDTO]
    let page: Int
    let pageSize: Int
    let count: Int
    let totalCount: Int
}

extension PokemonCardDTO {
    /// DTO를 도메인 모델로 변환합니다.
    func toDomain() -> PokemonCard {
        
        return .init(id: id,
                     name: name,
                     supertype: supertype,
                     types: types ?? [],
                     imageSmallURL: images.small,
                     imageLargeURL: images.large,
                     setInfo: setInfo)
    }
}
