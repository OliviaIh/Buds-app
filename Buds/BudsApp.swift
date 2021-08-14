//
//  BudsApp.swift
//  Buds
//
//  Created by Olivia Ih on 7/19/21.
//

import SwiftUI
import Firebase

@main
struct BudsApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            
            let authViewModel = UserAuthViewModel()
            let postingViewModel = PostingViewModel(authViewModel: authViewModel)
            
            ContentView()
                .environmentObject(authViewModel)
                .environmentObject(postingViewModel)
        }
    }
}


class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions:
        [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    FirebaseApp.configure()
    
    return true
  }
}
