//
//  MainViewViewModel.swift
//  RecipEat
//
//  Created by Nick on 2024-05-18.
//

import Foundation
import FirebaseAuth

class MainViewViewModel: ObservableObject{
    
    
    @Published var currentUserId:String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init(){
        
        self.handler = Auth.auth().addStateDidChangeListener{ [weak self] _, user in
            DispatchQueue.main.async{
                self?.currentUserId = user?.uid ?? ""
            }
        }
        
        
    }
    
    public var isSignedIn: Bool{
        print("Current user: \(currentUserId)")
        return Auth.auth().currentUser != nil
    }
}
