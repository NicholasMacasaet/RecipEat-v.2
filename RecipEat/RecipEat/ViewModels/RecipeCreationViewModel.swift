//
//  RecipeCreationViewModel.swift
//  RecipEat
//
//  Created by Nick on 2024-05-16.
//

import Foundation

import Firebase

class RecipeCreationViewModel: ObservableObject{
    
    /*
     Primitives for the ingredients
     */
//    @Published var ingredientName = ""
//    @Published var ingredientProtein = 0.0
//    @Published var ingredientFats = 0.0
//    @Published var ingredientCarbs = 0.0
//    @Published var ingredientkcal = 0
    
    @Published var ingredientName: String
    @Published var ingredientProtein: Double
    @Published var ingredientFats: Double
    @Published var ingredientCarbs: Double
    @Published var kcal: Int
    
    
    @Published var quantity = 1
    
//    @State var ingredientName = ""
//    @State var ingredientProtein = 0.0
//    @State var ingredientFats = 0.0
//    @State var ingredientCarbs = 0.0
//    @State var ingredientkcal = 0
//
    
    @Published var recipeName = ""
    
    @Published var recipeDirections = ""
    
    
    @Published var newRecipe: Recipe
    
    
    let db = Firestore.firestore()
    
    init(ingredientName: String,ingredientProtein: Double, ingredientFats: Double, ingredientCarbs: Double, kcal: Int ){
        self.newRecipe = Recipe(name: "", protein: 0.0 , fats: 0.0 , carbs: 0.0 , kcal: 0, directions: "", ingredients: [:])
        
        self.ingredientName = ingredientName
        self.ingredientProtein = ingredientProtein
        self.ingredientFats = ingredientFats
        self.ingredientCarbs = ingredientCarbs
        self.kcal = kcal
        
    }
    
    
    func registerRecipe (){
        guard addRecipeName() && addRecipeDirections() else{
            return
        }
        
        
        let recipeCollection = db.collection("recipes")
        
        
        do {
            try db.collection("recipes").addDocument(from: newRecipe)
        } catch let error {
            print("Error writing recipe to Firestore: \(error)")
        }

        
    }
    
    func clearPrimitives() -> Void {
        ingredientName = ""
        ingredientProtein = 0.0
        ingredientFats = 0.0
        ingredientCarbs = 0.0
        kcal = 0
    }
    
    
    /*
    meant to be used on button press from the search bar component
     */
    func addIngredients () -> Bool {
        
        /*
         make sure that the fields we're looking at aren't empty
         */
        guard !ingredientName.isEmpty && ingredientProtein != 0 && ingredientFats != 0
        && ingredientCarbs != 0 && kcal != 0 else{
            return false
        }
        
        if let currentIngredientCount = newRecipe.ingredients[ingredientName] {
            /*
             if the ingredient already exists within the new Recipe
             */
            newRecipe.ingredients[ingredientName] = currentIngredientCount + self.quantity
        }
        else{
            /*
             Add the ingredient into the sturctc
             */
            newRecipe.ingredients[ingredientName] = 1
        }
        
        /*
         in either case, update the new Recipe's macros accordingly
         */
        newRecipe.carbs += ingredientCarbs * Double(self.quantity)
        newRecipe.protein += ingredientProtein * Double(self.quantity)
        newRecipe.fats += ingredientFats * Double(self.quantity)
        /*casting because swift is pissy about it*/
        newRecipe.kcal += kcal * self.quantity
        
        /*
         now we clear the corresponding primitives
         */
        ingredientCarbs = 0.0
        ingredientProtein = 0.0
        ingredientFats = 0.0
        kcal = 0
        
        
        return true 
    }
    
    
    private func addRecipeDirections ()-> Bool{
        
        guard !recipeDirections.isEmpty else{
            return false
            /*
             potentially add an error message here
             */
        }
        
        newRecipe.directions = recipeDirections
        
        return true
        
    }
    
    
    private func addRecipeName () -> Bool {
        
        guard !recipeName.isEmpty else{
            return false
        }
        newRecipe.name = recipeName
        
        return true
    }
    
}
