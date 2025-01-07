//
//  ProfileView.swift
//  FireBase Learning
//
//  Created by Anket Kohak on 07/01/25.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject   var authViewModel : AuthViewModel

    var body: some View {
        VStack{
            Spacer()
            if let currentUser = authViewModel.currentUser  {
                Text("Full Name: \(currentUser.fullName)")
            }
            else{
                ProgressView("please wait...")
            }
            Spacer()
            Button("Sign Out"){
                authViewModel.signOut()
             }
        }
    }
}

#Preview {
    ProfileView()
}
