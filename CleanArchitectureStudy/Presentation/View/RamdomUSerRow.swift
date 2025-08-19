//
//  RamdomUSerRow.swift
//  CleanArchitectureStudy
//
//  Created by 장은석 on 8/19/25.
//

import SwiftUI

struct RamdomUSerRow: View {
    
    let user: User
    
    var body: some View {
        
        HStack(spacing: 8) {
            imageView
            
            Text(user.displayName)
            Spacer()
        }
        .frame(height: 60)
        .overlay(
            Rectangle()
                .fill(.gray)
                .frame(height: 1),
            alignment: .bottom
        )
    }
    
    // MARK: - view
    
    private var imageView: some View {
        
        AsyncImage(url: URL(string: user.avatarThumb ?? "")) { phase in
            
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(.circle)
            case .failure(let error):
                ProgressView()
            @unknown default:
                ProgressView()
            }
        }
    }
}

#Preview {
    RamdomUSerRow(user: User(id: UUID(), displayName: "321", email: "123", phone: "123", cell: "123", avatarLarge: "https://randomuser.me/api/portraits/thumb/men/12.jpg", avatarThumb: "https://randomuser.me/api/portraits/thumb/men/12.jpg"))
}
