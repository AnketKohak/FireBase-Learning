//
//  CreateAccountView.swift
//  FireBase Learning
//
//  Created by anket kohak on 15/11/24.
//

import SwiftUI

struct CreateAccountView: View {
    @State private var email: String = ""
    @State private var fullName: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @EnvironmentObject   var authViewModel : AuthViewModel
    @EnvironmentObject var router: Router

    // MARK: - Body
    var body: some View {
        VStack(spacing: 16){
            Text("Please complete all information to create an account.")
                .font(.headline).fontWeight(.medium)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
                .padding()
            
            InputView(
                placeholder: "Email or Phone number",
                isSecureField: false,
                text: $email
            )
            InputView(
                placeholder: "Full Name",
                isSecureField: false,
                text: $fullName
            )
            
            InputView(
                placeholder: "Enter Password",
                isSecureField: true,
                text: $password
            )
            ZStack(alignment: .trailing){
                 
                InputView(placeholder: "Confirm Your Password", isSecureField: true, text: $confirmPassword
                )
                Spacer()
                if !password.isEmpty && !confirmPassword.isEmpty{
                    Image(systemName: "\(isValid ? "checkmark" : "xmark").circle.fill")
                        .imageScale(.large)
                        .fontWeight(.bold)
                        .foregroundStyle(isValid ? .green : .red)
                }

            }
            
            Spacer()
            // MARK: - Button
            Button {
                Task{
                    await authViewModel.createUser(email: email, fullName: fullName, password: password)
                    if !authViewModel.isError{
                        router.navigateBack()
                    }
                }
            } label: {
                Text("Create Account")
            }.buttonStyle(CapsuleButtonStyle())

        }.navigationTitle("Set Up Your Account")
            .toolbarRole(.editor)
        
            .padding()
    }
    
    private var isValid: Bool {
        password == confirmPassword
    }
}

#Preview {
    CreateAccountView().environmentObject(AuthViewModel())
}
