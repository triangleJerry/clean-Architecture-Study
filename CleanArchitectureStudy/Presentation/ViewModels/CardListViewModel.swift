//
//  CardListViewModel.swift
//  CleanArchitectureStudy
//
//  Created by 장은석 on 6/30/25.
//

import SwiftUI

@MainActor
final class CardListViewModel: ObservableObject {
    
    @Published var cards: [PokemonCard] = []
    
    private let repository: PokemonRepository
    
    init(repository: PokemonRepository = {
        let client = URLSessionHTTPClient()
        let remote = PokemonRemoteDataSourceImpl(client: client)
        return PokemonRepositoryImpl(remote: remote)
    }()) {
        self.repository = repository
    }
    
    func load() async {
        do {
            cards = try await repository.fetchCards(page: 1, query: nil, filter: nil)
        } catch {
            print("Failed to fetch cards:", error)
        }
    }
}
