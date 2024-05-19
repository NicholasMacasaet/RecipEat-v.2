//
//  LoginViewModel.swift
//  RecipEat
//
//  Created by Nick on 2024-05-16.
//

import Foundation
import FirebaseAuth

class LoginViewModel: ObservableObject{
    
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage=""
    
    
    init(){
    }
    
    
    func login(){
        guard validate()else{
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password)
        
        print("Login Successful")
    
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty
        else{
            errorMessage = "Please fill in all fields"
            return false
        }
        
        
        guard email.contains("@") && email.contains(".")
        else{
            errorMessage = "Email is not valid"
            return false
        }
        
        return true
    }
    
    
}
