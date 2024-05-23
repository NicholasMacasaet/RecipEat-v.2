//
//  SearchBarViewModel.swift
//  RecipEat
//
//  Created by Nick on 2024-05-22.
//

import Foundation
import Firebase

class SearchBarViewModel: ObservableObject{
    
    
    @Published var ingredients = [Ingredient]()

    
    init(){
        let db = Firestore.firestore()
        
        db.collection("ingredients").getDocuments{ (snap, err)  in
            
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }
            
            for i in snap!.documents{
                let id = i.documentID
                let name = i.get("name") as! String
                let fats = i.get("fats") as! Double
                let carbs = i.get("carbs") as! Double
                let protein = i.get("protein") as! Double
                let kcal = i.get("kcal") as! Int
                self.ingredients.append(Ingredient(id: id, name: name, fats: fats, carbs: carbs, protein: protein, kcal: kcal))
            }
            
        }
        
    }
    
    
}
