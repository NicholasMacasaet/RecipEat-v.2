//
//  RecipEatApp.swift
//  RecipEat
//
//  Created by Nick on 2024-05-16.
//
import FirebaseCore
import SwiftUI


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}


@main
struct RecipEatApp: App {
    
//    init(){
//        FirebaseApp.configure()
//    }
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    
    var body: some Scene {
        
       
        WindowGroup {
            MainView()
        }
    }
}
