//
//  FireBase_LearningApp.swift
//  FireBase Learning
//
//  Created by anket kohak on 15/11/24.
//


import SwiftUI
import UIKit
import FirebaseCore
class AppDelegate: NSObject,UIApplicationDelegate{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
@main
struct FireBase_LearningApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private  var authViewModel = AuthViewModel()
    @ObservedObject private var router = Router()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.navPath){
                ContentView()
                    .navigationDestination(for: Router.AuthFlow.self) { destination in
                        router.destination(for: destination)
                    }
            }.environmentObject(authViewModel)
                .environmentObject(router)
        }
    }
}
