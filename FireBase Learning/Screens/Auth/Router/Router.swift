//
//  Router.swift
//  FireBase Learning
//
//  Created by Anket Kohak on 08/01/25.
//

import SwiftUI

final class Router:ObservableObject{
    @Published var navPath = NavigationPath()
    
    enum AuthFlow:Hashable,Codable{
        case login
        case createAccount
        case profile
        case forgotPasword
        case emailSent
    }
    
    func navigate(to destination: AuthFlow){
        navPath.append(destination)
    }
    func navigateBack(){
        navPath.removeLast()
    }
    func navigateToRoot(){
        navPath.removeLast(navPath.count)
    }
    
}
