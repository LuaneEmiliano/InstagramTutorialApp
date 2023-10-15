//
//  LoginViewModel.swift
//  InstagramTutorialApp
//
//  Created by luane Niejelski on 10/14/23.
//

import Foundation

class LoginViewModel: ObservableObject {
  
  @Published var email = ""
  @Published var password = ""
  
  func signIn() async throws {
    try await AuthService.shared.login(withEmail: email, password: password)
  }
}
