//
//  UserNetworkService.swift
//  CleanArchitectureStudy
//
//  Created by 장은석 on 8/19/25.
//

import Foundation

final class UserNetworkService {
    
    func fetchUsers() async throws -> [UserDTO] {
        
        guard let url = URL(string: "https://randomuser.me/api/?results=10") else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        let decodeData = try JSONDecoder().decode(UserResponseDTO.self, from: data)
        
        return decodeData.results
    }
}
