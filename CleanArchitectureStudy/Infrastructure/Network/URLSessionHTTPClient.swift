//
//  URLSessionHTTPClient.swift
//  CleanArchitectureStudy
//
//  Created by 장은석 on 6/26/25.
//

import Foundation

/// URLSessionProtocol 을 구현하는 기본 HTTP 클라이언트
public final class URLSessionHTTPClient: URLSessionProtocol {
    
    private let session: URLSession

    /// - Parameter session: 기본값은 .shared
    public init(session: URLSession = .shared) {
        self.session = session
    }

    public func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        return try await session.data(for: request)
    }
}
