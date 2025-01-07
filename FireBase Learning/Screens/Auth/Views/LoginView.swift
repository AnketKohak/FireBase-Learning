//
//  LoginView.swift
//  FireBase Learning
//
//  Created by anket kohak on 15/11/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @EnvironmentObject   var authViewModel : AuthViewModel
    // MARK: - Body
    var body: some View {
        NavigationStack {
            ScrollView{
                VStack(spacing:16){
                    //logo
                   image
                    //title
                   title
                    Spacer().frame(height: 12)
                    //textfields
                    InputView(placeholder: "Enter email address", isSecureField: false, text: $email)
                     
                    InputView(placeholder: "Enter the password", isSecureField: true, text: $password)
                    //forgot button
                    forgotButton
                    //login button
                    loginButton
                    //bottom view or
                    or
                    //apple
                   apple
                    //google
                   google
                    //footer
                    signUp
                   
                    
                }
            }.ignoresSafeArea()
                .padding(.horizontal)
                .padding(.vertical,8)
               
        }
    }
    // MARK: - Login and SignUp
   private var loginButton: some View {
        Button {
            Task{
                await authViewModel.login(email: email, password: password)
            }
        } label: {
            Text("Login")
        }.buttonStyle(CapsuleButtonStyle())

    }
    
    
    private var signUp: some View {
        NavigationLink{
            CreateAccountView().environmentObject(authViewModel)
        }label:{
            HStack{
                Text("Don't have an account?")
                    .foregroundStyle(.black)
                Text("Sign Up")
                    .foregroundStyle(.teal)
            }.fontWeight(.medium)
        }
    }
    
    
}

#Preview {
    LoginView()
}
// MARK: - Static Content
extension LoginView {
    private var apple: some View {
        Button {
        } label: {
            Label("Sign up with Apple", systemImage: "apple.logo")
        }.buttonStyle(CapsuleButtonStyle(bgColor: .black))
    }
    private var google: some View {
        Button {
        } label: {
            HStack{
                Image("google")
                    .resizable()
                    .frame(width: 15,height: 15)
                Text("Sign up with Google")
            }
        }.buttonStyle(CapsuleButtonStyle(
            textColor: .black, bgColor: .clear,
            hasBorder: true
        ))
    }
    private var image: some View {
        Image("login_image")
            .resizable()
            .scaledToFit()
    }
    private var title: some View {
        Text("Let's Connect with US!")
            .font(.title2)
            .fontWeight(.semibold)
    }
    
    private var forgotButton: some View {
        HStack{
            Spacer()
            Button {
            } label: {
                Text("Forgot Password?")
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    .fontWeight(.medium)
            }
        }
    }
    private var line:some View {
        VStack{
            Divider().frame(height:10)
        }
    }
    private var or: some View {
        HStack{
            line
            Text("or")
                .fontWeight(.semibold)
            line
        } .foregroundStyle(.gray)
    }
  
}
