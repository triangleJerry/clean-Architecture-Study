//
//  UserDTO.swift
//  CleanArchitectureStudy
//
//  Created by 장은석 on 8/19/25.
//

import Foundation

/*
 "gender": "female",
 "name": {
   "title": "Ms",
   "first": "Melanie",
   "last": "Rezende"
 },
 "email": "melanie.rezende@example.com",
 "phone": "(32) 8659-8600",
 "cell": "(44) 5235-7570",
 "id": {
   "name": "CPF",
   "value": "070.167.276-26"
 },
 "picture": {
   "large": "https://randomuser.me/api/portraits/women/72.jpg",
   "medium": "https://randomuser.me/api/portraits/med/women/72.jpg",
   "thumbnail": "https://randomuser.me/api/portraits/thumb/women/72.jpg"
 },
 */
struct UserDTO: Codable {
    
    let gender: String
    let name: UserNameDTO
    let email: String
    let phone: String
    let cell: String
    let id: UserRemoteIDDTO
    let picture: UserPictureDTO
    
    struct UserNameDTO: Codable {
        let title: String
        let first: String
        let last: String
    }

    struct UserRemoteIDDTO: Codable {
        let name: String
        let value: String?
    }

    struct UserPictureDTO: Codable {
        let large: String
        let medium: String
        let thumbnail: String
    }
    
    func toDomain() -> User {
        return User(
            gender: gender,
            name: .init(title: name.title, first: name.first, last: name.last),
            email: email,
            phone: phone,
            cell: cell,
            id: .init(name: id.name, value: id.value),
            picture: .init(large: picture.large, medium: picture.medium, thumbnail: picture.thumbnail)
        )
    }
}

extension Array where Element == UserDTO {
    func toDomain() -> [User] {
        return self.map { $0.toDomain() }
    }
}


