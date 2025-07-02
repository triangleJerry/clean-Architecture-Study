//
//  CardDetailView.swift
//  CleanArchitectureStudy
//
//  Created by 장은석 on 7/2/25.
//

import SwiftUI

struct CardDetailView: View {
    
    let card: PokemonCard

    var body: some View {
        
        ScrollView {
            VStack(spacing: 16) {
                AsyncImage(url: card.imageLargeURL) { phase in
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
                    .font(.largeTitle)
                Text(card.supertype)
                    .font(.title2)
                    .foregroundColor(.secondary)
            }
            .padding()
        }
        .navigationTitle(card.name)
    }
}

#Preview {
    CardDetailView(card: .mockInstance)
}
