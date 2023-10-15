//
//  MainTabView.swift
//  InstagramTutorialApp
//
//  Created by luane Niejelski on 10/12/23.
//

import SwiftUI

struct MainTabView: View {
  
  let user: User
  @State var selectedIndex = 0
  
  var body: some View {
    TabView(selection: $selectedIndex) {
    FeedView()
        .onAppear {
          selectedIndex = 0
        }
        .tabItem {
          Image(systemName: "house")
        }.tag(0)
      SearchView()
        .onAppear {
          selectedIndex = 1
        }
        .tabItem {
          Image(systemName: "magnifyingglass")
        }.tag(1)
      UploadPostView(tabIndex: $selectedIndex)
        .onAppear {
          selectedIndex = 2
        }.tag(2)
        .tabItem {
          Image(systemName: "plus.square")
        }
      Text("Notification")
        .onAppear {
          selectedIndex = 3
        }.tag(3)
        .tabItem {
          Image(systemName: "heart")
        }
        CurrentUserProfileView(user: user)
        .onAppear {
          selectedIndex = 4
        }.tag(4)
        .tabItem {
          Image(systemName: "person")
        }
    }
    .accentColor(.black)
  }
}

struct MainTabView_Previews: PreviewProvider {
  static var previews: some View {
    MainTabView(user: User.MOCK_USER[0])
  }
}
