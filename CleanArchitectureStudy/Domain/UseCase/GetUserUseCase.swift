//
//  GetUserUseCase.swift
//  CleanArchitectureStudy
//
//  Created by 장은석 on 8/19/25.
//

import Foundation

protocol GetUsersUseCase {
    
    func execute() async throws -> [User]
}

final class GetUsersUseCaseImpl: GetUsersUseCase {
    
    private let userRepository: UserRepository
    
    init(userRepository: UserRepository) {
        
        self.userRepository = userRepository
    }
    
    func execute() async throws -> [User] {
        
        return try await userRepository.getUsers()
    }
}
