//
//  ForgotPasswordView.swift
//  FireBase Learning
//
//  Created by Anket Kohak on 08/01/25.
//

import SwiftUI

struct ForgotPasswordView: View {
    @State private var email: String = ""
    @State private var isEmailSent = false
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var router: Router

    var body: some View {
        
        VStack(alignment: .leading){
            
            TopText
            
            InputView(placeholder: "Enter Your email", isSecureField: false, text: $email)
                .padding(.bottom, 16)
            
            Button{
                Task{
                    await authViewModel.resetPassword(by: email)
                    if !authViewModel.isError{
                        isEmailSent = true
                    }
                }
               
            }label:{
                Text("Send Instructions")
            }.buttonStyle(CapsuleButtonStyle())
            Spacer()
        }
        .padding()
        .toolbarRole(.editor)
        .navigationDestination(isPresented: $isEmailSent){ EmailSentView()
        }.onAppear{
            email = ""
        }
    }
    
    var TopText: some View {
        VStack(alignment: .leading, spacing: 8){
            Text("Reset Password")
                .font(.largeTitle)
            
            
            Text("Enter the email associated with your account and we'll send an email with instructions to reset your password")
                .font(.subheadline)
        }.padding(.bottom, 32)
    }
}

#Preview {
    ForgotPasswordView()
}
