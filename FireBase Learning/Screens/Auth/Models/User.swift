//
//  User.swift
//  FireBase Learning
//
//  Created by Anket Kohak on 06/01/25.
//
// MARK: - Model
import Foundation

struct User: Codable {
    let uid: String
    let email: String
    let fullName: String
    
    
    
}

// MARK: - Less used code
extension User{
    var initials: String{
        let formatter = PersonNameComponentsFormatter()
        if let components =  formatter.personNameComponents(from: fullName) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        else{
            return ""
        }
    }
}
