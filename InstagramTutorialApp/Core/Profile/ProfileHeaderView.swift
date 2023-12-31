//
//  ProfileHeaderView.swift
//  InstagramTutorialApp
//
//  Created by luane Niejelski on 10/13/23.
//

import SwiftUI

struct ProfileHeaderView: View {
  let user: User
  
    var body: some View {
      VStack {
        //header:
        VStack(spacing: 10) {
          //pic and stats
          HStack {
            Image(user.profileImageUrl ?? "")
              .resizable()
              .scaledToFill()
              .frame(width: 80, height: 80)
              .clipShape(Circle())
            
            Spacer()
            
            HStack (spacing: 8){
              UserStatView(value: 3, title: "Posts")
              UserStatView(value: 3, title: "Followers")
              UserStatView(value: 3, title: "Following")
            }
          }
          .padding(.horizontal)
          // name and bio
          VStack(alignment: .leading, spacing: 4) {
            if let fullname = user.fullName {
              Text(fullname)
                .font(.footnote)
                .fontWeight(.semibold)
            }
            if let bio = user.bio {
              Text(bio)
                .font(.footnote)
            }
            Text(user.username)
          }
          .frame(maxWidth: .infinity, alignment: .leading)
          .padding(.horizontal)
          // action button
          Button {
            
          } label: {
            Text("Edit Profile")
              .font(.headline)
              .fontWeight(.semibold)
              .frame(width: 360, height: 32)
              .foregroundColor(.black)
              .overlay(
                RoundedRectangle(cornerRadius: 6)
                  .stroke(Color.gray, lineWidth: 1)
              )
          }
          Divider()
        }
      }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
      ProfileHeaderView(user: User.MOCK_USER[0])
    }
}
