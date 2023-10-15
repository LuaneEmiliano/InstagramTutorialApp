//
//  User.swift
//  InstagramTutorialApp
//
//  Created by luane Niejelski on 10/12/23.
//

import Foundation

struct User: Identifiable, Codable, Hashable {
  let id: String
  var username: String
  var profileImageUrl: String?
  var fullName: String?
  var bio: String?
  let email: String
}

extension User {
  static var MOCK_USER: [User] = [
    .init(id: NSUUID().uuidString, username: "Los Angeles", profileImageUrl: "SantaMonica", fullName: "Los Angeles", bio: "The City of Angels", email: "losangeles@gmail.com"),
    .init(id: NSUUID().uuidString, username: "Los Angeles2", profileImageUrl: "SantaMonica", fullName: "Los Angeles", bio: "The City of Angels2",  email: "losangeles@gmail.com"),
    .init(id: NSUUID().uuidString, username: "Los Angeles3", profileImageUrl: "SantaMonica", fullName: "Los Angeles", bio: "The City of Angels3",  email: "losangeles@gmail.com"),
    .init(id: NSUUID().uuidString, username: "Los Angeles4", profileImageUrl: "SantaMonica", fullName: "Los Angeles", bio: "The City of Angels4",  email: "losangeles@gmail.com"),
    .init(id: NSUUID().uuidString, username: "Los Angeles5", profileImageUrl: "SantaMonica", fullName: "Los Angeles", bio: "The City of Angels5",  email: "losangeles@gmail.com")
  
  
  ]
}
