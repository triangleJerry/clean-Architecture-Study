//
//  UserRepository.swift
//  CleanArchitectureStudy
//
//  Created by 장은석 on 8/19/25.
//

import Foundation

protocol UserRepository {
    
    func getUsers() async throws -> [User]
}

final class UserRepositoryImpl: UserRepository {
    
    private let service: UserNetworkService
    
    init(service: UserNetworkService) {
        
        self.service = service
    }
    
    func getUsers() async throws -> [User] {
        
        let dtos = try await service.fetchUsers()
        return dtos.toDomain()
    }
}
