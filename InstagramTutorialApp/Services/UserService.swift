//
//  UserService.swift
//  InstagramTutorialApp
//
//  Created by luane Niejelski on 10/15/23.
//

import Foundation
import Firebase

struct UserService {
  
  // static func allows you call the user without initialize it.
 static func fetchAllUsers() async throws -> [User] {
   var users = [User]()
   let snapshot = try await Firestore.firestore().collection("users").getDocuments()
    let documents = snapshot.documents
    
    for doc in documents {
      print(doc.data())
    }
   return users 
  }
}
