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

extension URLSession: URLSessionProtocol { }
