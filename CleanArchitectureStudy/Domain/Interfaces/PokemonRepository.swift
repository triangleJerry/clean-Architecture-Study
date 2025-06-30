//
//  PokemonRepository.swift
//  CleanArchitectureStudy
//
//  Created by 장은석 on 6/26/25.
//

import Foundation

protocol PokemonRepository {
    
    /// 검색어(query)와 Lucene 필터(filter)를 합쳐서 요청합니다.
    func fetchCards(page: Int,
                    query: String?,
                    filter: String?) async throws -> [PokemonCard]
    func fetchFavorites() async throws -> [PokemonCard]
    func toggleFavorite(_ card: PokemonCard) async throws
}
