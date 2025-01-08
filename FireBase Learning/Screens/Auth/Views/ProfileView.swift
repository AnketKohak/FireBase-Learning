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
        List{
            Section{
                HStack(spacing: 16){
                    Text("YP")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 70, height: 70)
                        .background(Color(.lightGray))
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading , spacing: 4){
                        Text("Yogesh Patel")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        Text("yogesh@gmail.com")
                            .font(.footnote)
                    }
                }
            }
            Section("Account"){
                Button{
                    
                } label: {
                    Label{
                        Text("Sign Out")
                            .foregroundStyle(.black)
                    } icon: {
                        Image(systemName: "arrow.left.circle.fill")
                            .foregroundStyle(.red)
                    }
                }
                Button{
                    
                } label: {
                    Label{
                        Text("Delete Account")
                            .foregroundStyle(.black)
                    } icon: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundStyle(.red)
                    }
                }
                
            }
        }
    }
}

#Preview {
    ProfileView().environmentObject(AuthViewModel())
}
