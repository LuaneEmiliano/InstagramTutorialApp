//
//  Post.swift
//  InstagramTutorialApp
//
//  Created by luane Niejelski on 10/13/23.
//

import Foundation

struct Post: Identifiable, Hashable, Codable {
  let id: String
  let ownerUid: String
  let caption: String
  var likes: Int
  let imageUrl: String
  let timestamp: Date
  var user: User?
}

extension Post {
  static var MOCK_POSTS: [Post] = [
    .init(id: NSUUID().uuidString,
       ownerUid: NSUUID().uuidString,
       caption: "Santa Monica",
       likes: 250,
       imageUrl: "SantaMonica",
       timestamp: Date(),
          user: User.MOCK_USER[3]),
  
      .init(id: NSUUID().uuidString,
         ownerUid: NSUUID().uuidString,
         caption: "HB",
         likes: 20,
         imageUrl: "HuntingtonBeach",
         timestamp: Date(),
            user: User.MOCK_USER[2]),
    
    .init(id: NSUUID().uuidString,
       ownerUid: NSUUID().uuidString,
       caption: "Santa Monica2",
       likes: 25,
       imageUrl: "SantaMonica",
       timestamp: Date(),
          user: User.MOCK_USER[1]),
    
      .init(id: NSUUID().uuidString,
         ownerUid: NSUUID().uuidString,
         caption: "Huntington Beach",
         likes: 50,
         imageUrl: "HuntingtonBeach",
         timestamp: Date(),
            user: User.MOCK_USER[4]),
    
      .init(id: NSUUID().uuidString,
         ownerUid: NSUUID().uuidString,
         caption: "Griffth",
         likes: 2500,
         imageUrl: "Griffith",
         timestamp: Date(),
            user: User.MOCK_USER[0])
  ]
}
