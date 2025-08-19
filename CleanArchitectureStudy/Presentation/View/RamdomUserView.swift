//
//  RamdomUserView.swift
//  CleanArchitectureStudy
//
//  Created by 장은석 on 8/18/25.
//

import SwiftUI

struct RamdomUserView: View {
    
    @StateObject private var viewModel: RamdomUserViewModel
    
    init(viewModel: RamdomUserViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        
        ScrollView {
            
            LazyVStack {
                ForEach(viewModel.users) { user in
                    RamdomUSerRow(user: user)
                        .task {
                            if user == viewModel.users.last {
                                await viewModel.getUsers()
                            }
                        }
                }
            }
            
            if viewModel.isLoading {
                ProgressView()
            }
        }
        .task {
            await viewModel.getUsers()
        }
    }
}

#Preview {
    // Lightweight composition root for preview
    let service = UserNetworkService()
    let repo = UserRepositoryImpl(service: service)
    let useCase = GetUsersUseCaseImpl(userRepository: repo)
    let vm = RamdomUserViewModel(useCase: useCase)
    return RamdomUserView(viewModel: vm)
}
