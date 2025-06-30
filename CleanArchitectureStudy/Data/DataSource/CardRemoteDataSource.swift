//
//  CardRemoteDataSource.swift
//  CleanArchitectureStudy
//
//  Created by 장은석 on 6/26/25.
//

import Foundation

protocol CardRemoteDataSource {
    
    /// PokéTCG API v2 에서 카드 리스트를 가져옵니다.
    func fetchCards(page: Int,
                    query: String?,
                    filter: String?) async throws -> [PokemonCardDTO]
}
