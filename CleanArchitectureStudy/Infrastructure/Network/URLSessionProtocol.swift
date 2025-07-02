//
//  URLSessionProtocol.swift
//  CleanArchitectureStudy
//
//  Created by 장은석 on 6/26/25.
//

import Foundation

/// URLSession 의 `data(for:)` 를 추상화한 프로토콜
protocol URLSessionProtocol {
    
    /// 지정한 요청을 수행하고, 결과로 Data & URLResponse 를 반환합니다.
    func data(for request: URLRequest) async throws -> (Data, URLResponse)
}

extension URLSessionProtocol {
    
    /// 주어진 URL로 요청을 보내고, Decodable 타입으로 디코딩하여 반환합니다.
    func decodable<T: Decodable>(_ type: T.Type, from url: URL) async throws -> T {
        let (data, response) = try await data(for: URLRequest(url: url))
        guard let http = response as? HTTPURLResponse, 200..<300 ~= http.statusCode else {
            throw APIError.unexpectedStatus((response as? HTTPURLResponse)?.statusCode ?? -1)
        }
        return try JSONDecoder().decode(type, from: data)
    }
}

extension URLSession: URLSessionProtocol { }
