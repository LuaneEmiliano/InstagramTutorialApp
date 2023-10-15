//
//  SearchViewModel.swift
//  InstagramTutorialApp
//
//  Created by luane Niejelski on 10/15/23.
//

import Foundation

class SearchViewModel: ObservableObject {
  @Published var users = [User]()
  
  init() {
    Task { try await fetchAllUsers() }
  }
  func fetchAllUsers() async throws {
    let users = try await UserService.fetchAllUsers()
  }
}
