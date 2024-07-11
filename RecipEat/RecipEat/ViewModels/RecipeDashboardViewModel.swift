//
//  RecipeDashboardViewModel.swift
//  RecipEat
//
//  Created by Nick on 2024-05-16.
//

import Foundation
import Firebase
import FirebaseAuth

//view model for list of recipes 
class RecipeDashboardViewModel: ObservableObject{
    
    
    @Published var recipes = [String]()
    
    
    typealias NutritionInfo = (name: String, protein: Double, carbs: Double, fats: Double, kcal: Int)
    
    @Published var recipesUwU: [NutritionInfo] = []
    
    @Published var recipePhotos: [String: String] = [:]
    //first line is the recipe, second is the photo
    
    let currUser = Auth.auth().currentUser?.uid
    
    init(){
        
        let db = Firestore.firestore()

        
        db.collection("recipes").getDocuments{ (snap, err) in
            
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }
            
            for i in snap!.documents{
    
                /*
                 code that will validate whether or not this user owns this recipe
                 */
                
                let recipeOwner = i.get("owner") as! String
                
                if recipeOwner == self.currUser{
            
                    let name = i.get("name") as! String
                    
                    let protein = i.get("protein") as! Double
                    let fats = i.get("fats") as! Double
                    let carbs = i.get("carbs") as! Double
                    let kcal = i.get("kcal") as! Int
                    
    
                    self.recipes.append(name)
                    
                    self.recipesUwU.append((name, protein, fats, carbs, kcal))
                    /*
                     TODO: Unpack the info for the other fields in here as well
                     */
                    
                    
                    let photosRef = db.collection("recipes").document(i.documentID).collection("photos")
                    
                    photosRef.getDocuments{
                        (snap, error) in
                        
                        if error != nil{
                            print("error loading photo")
                        }
                        
                        
                        if let document = snap?.documents.first{
                            if let imageURL = document.get("imageURL") as? String {
                                self.recipePhotos[name] = imageURL
                            }
                        }
                    }
                    
                }
            
            }

            
            
        }
    }
    
    
    
}
