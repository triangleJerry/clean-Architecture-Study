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
            
            Text(user.name.title)
            Spacer()
        }
        .frame(height: 60)
        .overlay(
            Rectangle()
                .fill(.gray)
                .frame(height: 1),
            alignment: .bottom
        )
        .background(.green)
    }
    
    // MARK: - view
    
    private var imageView: some View {
        
        AsyncImage(url: URL(string: user.picture.thumbnail)) { phase in
            
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(.circle)
            case .failure(_):
                ProgressView()
            @unknown default:
                ProgressView()
            }
        }
    }
}

#Preview {
    
    let user = User(gender: "gender", name: .init(title: "title", first: "first", last: "last"), email: "email", phone: "010=1234-5678", cell: "cell", id: .init(name: "name", value: "value"), picture: .init(large: "https://randomuser.me/api/portraits/thumb/men/12.jpg", medium: "https://randomuser.me/api/portraits/thumb/men/12.jpg", thumbnail: "https://randomuser.me/api/portraits/thumb/men/12.jpg"))
    
    RamdomUSerRow(user: user)
    
}
