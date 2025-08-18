//
//  User.swift
//  CleanArchitectureStudy
//
//  Created by 장은석 on 8/18/25.
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
struct User: Identifiable, Codable {
    
    let id = UUID()
    let gender: String
    let name: UserName
    let email: String
    let phone: String
    let cell: String
    let userId: USerRemoteID
    let picture: USerPicture

    enum CodingKeys: String, CodingKey {
        case gender, name, email, phone, cell, picture
        case userId = "id"
    }
}

struct UserName: Codable {
    let title: String
    let first: String
    let last: String
}

struct USerRemoteID: Codable {
    let name: String
    let value: String?
}

struct USerPicture: Codable {
    let large: String
    let medium: String
    let thumbnail: String
}
