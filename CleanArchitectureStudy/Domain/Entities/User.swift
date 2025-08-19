//
//  User.swift
//  CleanArchitectureStudy
//
//  Created by 장은석 on 8/18/25.
//

import Foundation

struct User: Identifiable, Equatable {
    
    let id: UUID
    let displayName: String
    let email: String?
    let phone: String?
    let cell: String?
    let avatarLarge: String?
    let avatarThumb: String?
}
