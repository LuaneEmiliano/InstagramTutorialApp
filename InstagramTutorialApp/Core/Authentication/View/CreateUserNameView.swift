//
//  CreateUserNameView.swift
//  InstagramTutorialApp
//
//  Created by luane Niejelski on 10/12/23.
//

import SwiftUI

struct CreateUserNameView: View {
  @EnvironmentObject var viewModel: RegistrationViewModel
  @Environment(\.dismiss) var dismiss
  
  var body: some View {
    VStack {
      Text("Create Username")
        .font(.title2)
        .fontWeight(.bold)
        .padding(.top)
      
      Text("Pick a username for your new account. You can always change it later.")
        .font(.footnote)
        .foregroundColor(.gray)
        .multilineTextAlignment(.center)
        .padding(.horizontal, 24)
      
      TextField("Enter your email", text: $viewModel.username)
        .autocapitalization(.none)
        .modifier(IGTextFieldModifier())
      
      NavigationLink {
        CreatePasswordView()
          .navigationBarBackButtonHidden()
      } label: {
        Text("Next")
          .font(.subheadline)
          .fontWeight(.semibold)
          .foregroundColor(.white)
          .frame(width: 360, height: 44)
          .background(Color(.systemBlue))
          .cornerRadius(8)
      }
      .padding(.vertical)
      Spacer()
    }
    .toolbar {
      ToolbarItem(placement: .navigationBarLeading) {
        Image(systemName: "chevron.left")
          .imageScale(.large)
          .onTapGesture {
            dismiss()
          }
      }
    }
  }
}
struct CreateUserNameView_Previews: PreviewProvider {
  static var previews: some View {
    CreateUserNameView()
  }
}
