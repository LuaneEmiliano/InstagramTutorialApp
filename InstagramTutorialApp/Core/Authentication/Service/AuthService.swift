//
//  AuthService.swift
//  InstagramTutorialApp
//
//  Created by luane Niejelski on 10/13/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestoreSwift
import Firebase
import FirebaseFirestore

@MainActor
class AuthService {
  
  @Published var currentUser: User?
  @Published var userSession: FirebaseAuth.User?
  
  static let shared = AuthService()
  
  init() {
    Task { try await loadUserData() }
  }

  func login(withEmail email: String, password: String) async throws {
    do {
      let result = try await Auth.auth().signIn(withEmail: email, password: password)
      self.userSession = result.user
      Task { try await loadUserData() }
    } catch {
      print("DEBUG: Failed to login in user with error \(error.localizedDescription)")
    }
  }

  func createUser(email: String, password: String, username: String) async throws {
    do {
      let result = try await Auth.auth().createUser(withEmail: email, password: password)
      self.userSession = result.user
      await self.uploadUserData(uid: result.user.uid, username: username, email: email)
     } catch {
      print("DEBUG: Failed to register user with error \(error.localizedDescription)")
    }
  }
  
  func loadUserData() async throws {
    self.userSession = Auth.auth().currentUser
    guard let currentUid = self.userSession?.uid else { return }
    // Gets the info from Firebase and return it to the user
    let snapshot = try await Firestore.firestore().collection("users").document(currentUid).getDocument()
    //Decoding operation 
    self.currentUser = try? snapshot.data(as: User.self)
    
  }
  func signOut() {
    try? Auth.auth().signOut()
    self.userSession = nil
    self.currentUser = nil
  }
  func uploadUserData(uid: String, username: String, email: String) async {
    let user = User(id: uid, username: username, email: email)
    self.currentUser = user
    guard  let encodedUser = try? Firestore.Encoder().encode(user) else { return }
    //Where the data goes in Firebase
    try? await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
  }
}
