//
//  PokemonRemoteDataSourceImpl.swift
//  CleanArchitectureStudy
//
//  Created by 장은석 on 6/26/25.
//

import Foundation

final class PokemonRemoteDataSourceImpl: CardRemoteDataSource {
    
    private let baseURL = URL(string: "https://api.pokemontcg.io/v2/cards")!
    private let pageSize = 20
    private let client: URLSessionProtocol   // URLSessionHTTPClient로 DI

    init(client: URLSessionProtocol) {
        self.client = client
    }
    
    // MARK: - func

    func fetchCards(page: Int,
                    query: String?,
                    filter: String?) async throws -> [PokemonCardDTO] {
        // 쿼리 파라미터 구성
        guard var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: false) else {
            return []
        }
        
        components.queryItems = [
            URLQueryItem(name: "page", value: "\(page)"),
            URLQueryItem(name: "pageSize", value: "\(pageSize)"),
            URLQueryItem(name: "select", value: "id,name,supertype,types,images,set")
        ] + {
            var items: [URLQueryItem] = []
            if let q = query, !q.isEmpty {
                items.append(.init(name: "q", value: "name:\"*\(q)*\""))
            }
            if let f = filter, !f.isEmpty {
                items.append(.init(name: "q", value: f))
            }
            return items
        }()

        guard let url = components.url else {
            return []
        }
        
        // URLSessionProtocol 확장(decodable)을 사용해 간단히 요청 및 디코딩
        let dto = try await client.decodable(PokemonCardsResponseDTO.self, from: url)
        return dto.data
    }
}

// 간단한 Error 정의
enum APIError: Error {
    
    case unexpectedStatus(Int)
}
