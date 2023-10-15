//
//  RegistrationViewModel.swift
//  InstagramTutorialApp
//
//  Created by luane Niejelski on 10/13/23.
//

import Foundation
import Firebase

@MainActor
class RegistrationViewModel: ObservableObject {
  @Published var username = ""
  @Published var email = ""
  @Published var password = ""
  
  func createUser() async throws {
    try await AuthService.shared.createUser(email: email, password: password, username: username)
    
    username = ""
    email = ""
    password = ""
  }
}
