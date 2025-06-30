//
//  MainView.swift
//  CleanArchitectureStudy
//
//  Created by 장은석 on 6/26/25.
//

import SwiftUI

struct MainView: View {
    
    @StateObject private var viewModel = CardListViewModel()
    
    var body: some View {
        
        NavigationView {
            
            scrollview
                .refreshable {
                    await viewModel.load()
                }
                .navigationTitle("Pokémon Cards")
        }
        .task {
            await viewModel.load()
        }
    }
    
    // MARK: - view
    
    private var scrollview: some View {
        
        ScrollView {
            
            LazyVStack(spacing: 16) {
                
                ForEach(viewModel.cards) { card in
                    VStack(alignment: .leading, spacing: 8) {
                        AsyncImage(url: card.imageSmallURL) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: .infinity)
                            case .failure:
                                Color.gray.frame(height: 100)
                            @unknown default:
                                EmptyView()
                            }
                        }
                        Text(card.name)
                            .font(.headline)
                        Text(card.supertype)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .padding(.horizontal)
                }
            }
            .padding(.top)
        }
    }
}

#Preview {
    MainView()
}
