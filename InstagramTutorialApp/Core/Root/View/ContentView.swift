//
//  ContentView.swift
//  InstagramTutorialApp
//
//  Created by luane Niejelski on 10/12/23.
//

import SwiftUI

struct ContentView: View {
  @StateObject var registrationViewModel = RegistrationViewModel()
  @StateObject var viewModel = ContentViewModel()
  
  var body: some View {
    Group {
      if viewModel.userSession == nil {
        LoginView()
          .environmentObject(registrationViewModel)
      } else if let currentUser = viewModel.currentUser {
        MainTabView(user: currentUser)
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
