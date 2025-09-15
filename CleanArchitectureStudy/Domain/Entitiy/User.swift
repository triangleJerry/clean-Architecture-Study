//
//  User.swift
//  CleanArchitectureStudy
//
//  Created by 장은석 on 8/18/25.
//

import Foundation

struct User: Equatable, Identifiable {
    
    let uuid = UUID()
    let gender: String
    let name: UserName
    let email: String
    let phone: String
    let cell: String
    let id: UserRemoteId
    let picture: UserPicture
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.uuid == rhs.uuid
    }
    
    /// Hashable을 채택하여 User의 Identifiable(ID = UserRemoteId) 요구사항을 만족
    struct UserRemoteId: Codable, Hashable {
        let name: String
        let value: String?
    }
    
    struct UserName: Codable {
        let title: String
        let first: String
        let last: String
    }

    struct UserPicture: Codable {
        let large: String
        let medium: String
        let thumbnail: String
    }
}
