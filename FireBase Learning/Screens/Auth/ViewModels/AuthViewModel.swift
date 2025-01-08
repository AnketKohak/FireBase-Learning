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
@MainActor
final class AuthViewModel: ObservableObject {
 
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    @Published var isError: Bool = false
    private let auth = Auth.auth()
    private let firestore = Firestore.firestore()
    
    init(){
        Task{
            await loadUser()
        }
    }
    
    func loadUser() async {
        if let user = auth.currentUser{
            userSession = user
            await fetchUser(by: user.uid)
        }
    }
    
    
    func login(email: String, password: String)async{
        do{
            let authResult = try await auth.signIn(withEmail: email,password: password)
            userSession = authResult.user
            await fetchUser(by: authResult.user.uid)
        }
        catch{
            isError = true
        }
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
    func fetchUser(by uid:String) async{
        do{
            let document = try await firestore.collection("users").document(uid).getDocument()
            currentUser = try document.data(as: User.self)
        }
        catch{
            isError = true
        }
    }
    func signOut(){
        do{
            userSession = nil
            currentUser = nil
            try auth.signOut()
        }
        catch{
            isError = true
        }
    }
    func deleteAccount() async{
        do{
            userSession = nil
            currentUser = nil
            deleteUser(by: auth.currentUser?.uid ?? "")
           try await auth.currentUser?.delete()
        }catch{
            isError = true
        }
        
    }
    private func deleteUser(by uid : String){
        firestore.collection("users").document(uid).delete()
    }
}
