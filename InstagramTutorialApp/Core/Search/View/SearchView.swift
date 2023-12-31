//
//  SearchView.swift
//  InstagramTutorialApp
//
//  Created by luane Niejelski on 10/12/23.
//

import SwiftUI

struct SearchView: View {
  
  @State private var searchText = ""
  @StateObject var viewModel = SearchViewModel()
  
  var body: some View {
    NavigationStack {
      ScrollView {
        LazyVStack(spacing: 12) {
          ForEach(User.MOCK_USER) { user in
            NavigationLink(value: user) {
              HStack {
                Image(user.profileImageUrl ?? "")
                  .resizable()
                  .scaledToFill()
                  .frame(width: 40, height: 40)
                  .clipShape(Circle())
                
                VStack(alignment: .leading) {
                  Text(user.username)
                    .fontWeight(.semibold)
                  if let fullname = user.fullName {
                    Text(fullname)
                  }
                  
                }
                .font(.footnote)
                Spacer()
              }
              .foregroundColor(.black)
              .padding(.horizontal)
            }
          }
        }
        .padding(.top, 8)
        .searchable(text: $searchText, prompt: "Search...")
      }
      .navigationDestination(for: User.self, destination: { user in
        ProfileView(user: user)
      })
      .navigationTitle("Explore")
      .navigationBarTitleDisplayMode(.inline)
    }
  }
}

struct SearchView_Previews: PreviewProvider {
  static var previews: some View {
    SearchView()
  }
}
