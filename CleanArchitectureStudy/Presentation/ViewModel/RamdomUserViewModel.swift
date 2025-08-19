//
//  RamdomUserViewModel.swift
//  CleanArchitectureStudy
//
//  Created by 장은석 on 8/19/25.
//

import SwiftUI

@MainActor
final class RamdomUserViewModel: ObservableObject {
    
    private let useCase: GetUsersUseCaseImpl
    @Published var users: [User] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    init(useCase: GetUsersUseCaseImpl) {
        
        self.useCase = useCase
    }
    
    // MARK: - func
    
    func getUsers() async {
        
        isLoading = true
        
        defer {
            isLoading = false
        }
        
        do {
            let result = try await useCase.execute()
            users.append(contentsOf: result)
            
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
