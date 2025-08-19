//
//  CleanArchitectureStudyApp.swift
//  CleanArchitectureStudy
//
//  Created by 장은석 on 8/18/25.
//

import SwiftUI

@main
struct CleanArchitectureStudyApp: App {
    var body: some Scene {
        WindowGroup {
            
            let service = UserNetworkService()
            let repo = UserRepositoryImpl(service: service)
            let useCase = GetUsersUseCaseImpl(userRepository: repo)
            let vm = RamdomUserViewModel(useCase: useCase)
            RamdomUserView(viewModel: vm)
        }
    }
}
