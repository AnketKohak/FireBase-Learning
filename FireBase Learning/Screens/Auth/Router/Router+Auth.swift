//
//  Router+Auth.swift
//  FireBase Learning
//
//  Created by Anket Kohak on 08/01/25.
//

import SwiftUI
 


extension Router{
    
    @ViewBuilder 
    func destination(for flow: AuthFlow) -> some View{
        switch flow {
        case .login: LoginView()
        case .createAccount: CreateAccountView()
        case .profile: ProfileView()
        case .forgotPasword: ForgotPasswordView()
        case .emailSent: EmailSentView()
        }
    }
}
