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
        
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: false)!
        // 기본 쿼리
        var items: [URLQueryItem] = [
            .init(name: "page",      value: "\(page)"),
            .init(name: "pageSize",  value: "\(pageSize)"),
            .init(name: "select",    value: "id,name,supertype,types,images,set")
        ]
        // Lucene 스타일 검색 / 필터
        var qItems: [String] = []
        if let q = query, !q.isEmpty {
            // 이름 검색 시 와일드카드 포함 예시: name:"*검색어*"
            qItems.append("name:\"*\(q)*\"")
        }
        if let f = filter, !f.isEmpty {
            // ex) types:Fire 또는 supertype:Energy
            qItems.append(f)
        }
        if !qItems.isEmpty {
            items.append(.init(name: "q", value: qItems.joined(separator: " ")))
        }
        components.queryItems = items

        let request = URLRequest(url: components.url!)
        let (data, response) = try await client.data(for: request)
        guard let http = response as? HTTPURLResponse, 200..<300 ~= http.statusCode else {
            throw APIError.unexpectedStatus((response as? HTTPURLResponse)?.statusCode ?? -1)
        }

        let dto = try JSONDecoder().decode(PokemonCardsResponseDTO.self, from: data)
        return dto.data
    }
}

// 간단한 Error 정의
enum APIError: Error {
    case unexpectedStatus(Int)
}
