//
//  PokemonRepositoryImpl.swift
//  CleanArchitectureStudy
//
//  Created by 장은석 on 6/26/25.
//

import Foundation

final class PokemonRepositoryImpl: PokemonRepository {
    
    private let remote: CardRemoteDataSource
    // private let local: LocalDataSource   // 즐겨찾기 저장소(UserDefaults/CoreData)

    init(remote: CardRemoteDataSource) {
        self.remote = remote
        // self.local = local
    }

    func fetchCards(page: Int,
                    query: String?,
                    filter: String?) async throws -> [PokemonCard] {
        let dtos = try await remote.fetchCards(page: page, query: query, filter: filter)
        // 즐겨찾기 로직 미구현: 모든 카드 isFavorite 기본값(false) 유지
        return dtos.map { $0.toDomain() }
    }

    // 즐겨찾기 기능 미구현: 빈 배열 반환
    func fetchFavorites() async throws -> [PokemonCard] {
        return []
    }

    // 즐겨찾기 토글 기능 미구현
    func toggleFavorite(_ card: PokemonCard) async throws {
        // no-op
    }
}
