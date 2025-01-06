//
//  AuthViewModel.swift
//  FireBase Learning
//
//  Created by Anket Kohak on 06/01/25.
//
// MARK: - ViewModel
import Foundation
import FirebaseAuth
import FirebaseFirestore

final class AuthViewModel: ObservableObject {
 
    @Published var userSession: FirebaseAuth.User?
    @Published var user: User?
    @Published var isError: Bool = false
    private let auth = Auth.auth()
    private let firestore = Firestore.firestore()
    
    init(){
        
    }
    
    func createUser(email: String,fullName: String, password: String) async{
        do{
            let authResult = try await auth.createUser(withEmail: email, password: password)
           await storeUserInFirestore(uid: authResult.user.uid, email: email, fullName: fullName)
        }
        catch{
            isError = true
        }
    }
    func storeUserInFirestore(uid: String,email: String,fullName: String) async{
        let user = User(uid: uid, email: email, fullName: fullName)
        do{
            try firestore.collection("users").document(uid).setData(from: user)
        }
        catch{
            isError = true
        }
    }
}
