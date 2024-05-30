//
//  RecipeDashboardViewModel.swift
//  RecipEat
//
//  Created by Nick on 2024-05-16.
//

import Foundation
import Firebase


//view model for list of recipes 
class RecipeDashboardViewModel: ObservableObject{
    
    
    @Published var recipes = [String]()
    
    init(){
        
        let db = Firestore.firestore()

        
        db.collection("recipes").getDocuments{ (snap, err) in
            
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }
            
            for i in snap!.documents{
                
                let name = i.get("name") as! String
                
                self.recipes.append(name)
            }

            
            
        }
    }
    
    
    
}
