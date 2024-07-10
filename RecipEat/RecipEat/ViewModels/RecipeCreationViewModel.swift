//
//  RecipeCreationViewModel.swift
//  RecipEat
//
//  Created by Nick on 2024-05-16.
//

import Foundation
import FirebaseAuth
import Firebase
import FirebaseStorage


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
    // stuff for macros
    
    @Published var currImage = UIImage()
    //currently selected photo
    
    @Published var recipeName = ""
    @Published var recipeDirections = ""
    @Published var newRecipe: Recipe

    @Published private var curr_user: String
    
    
    
    
    let db = Firestore.firestore()
    
    init(ingredientName: String,ingredientProtein: Double, ingredientFats: Double, ingredientCarbs: Double, kcal: Int){
        self.newRecipe = Recipe(name: "", protein: 0.0 , fats: 0.0 , carbs: 0.0 , kcal: 0, directions: "", ingredients: [:], owner:"")
        
        self.ingredientName = ingredientName
        self.ingredientProtein = ingredientProtein
        self.ingredientFats = ingredientFats
        self.ingredientCarbs = ingredientCarbs
        self.kcal = kcal
        
        
        
        
        if let user = Auth.auth().currentUser{
            self.curr_user = user.uid
        }
        else{
            self.curr_user = ""
        }
    }
    
    
    func registerRecipe () async{
        guard addRecipeName() && addRecipeDirections() else{
            return
        }
        
        newRecipe.owner = self.curr_user
        
        
        let recipeCollection = db.collection("recipes")
        
        
        do {
            let documentReference = try db.collection("recipes").addDocument(from: newRecipe)
            let recipeID = documentReference.documentID
            var newPhoto = Photo()
            newPhoto.owner = curr_user
            newPhoto.recipe = recipeName
            if await saveImage(recipeID: recipeID, photo: newPhoto, image: currImage){
                print("Image saving succesful")
            }
            else{
                print("Image saving failed in registerRecipe()")
            }
            
            
//            do{
//                let _ = try await saveImage(recipeID: recipeID, photo: newPhoto, image: currImage)
//            }catch{
//                print("Error in saving image during recipe saving function ")
//            }
            
            
            
            //here we call the saveImage function, passing in the recipeID, our photo struct, and our UIimage we get from the view
            //
            
            print("document added, adding photo now")
            
            
            
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
        
        print("test")
        
        
        print("Saved ingredient Name: \(ingredientName)")
        print("Saved ingredient Protein: \(ingredientProtein)")
        print("Saved ingredient Fats: \(ingredientFats)")
        print("Saved ingredient Carbs: \(ingredientCarbs)")
        
        
        guard !ingredientName.isEmpty else{
            return false
        }
        
        print("test 2")
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
        
        
        print("Added Ingredient: \(ingredientName)")
        
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
    
    
    func saveImage(recipeID: String, photo: Photo, image: UIImage) async -> Bool{
        /*
         Calling this after we save the recipe
         
         */
        guard recipeID != "" else{
            print("recipe id is empty ")
            return false
        }
        
        let photoName = UUID().uuidString
        let storage = Storage.storage() //firebase instance
        let storageRef = storage.reference().child("\(recipeID)/\(photoName).jpeg")
        
        
        guard let resizedImage = image.jpegData(compressionQuality: 0.2) else {
            return false
        }
        //setting up compression
        
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpg"
        //setting up metadata
        
        var imageUrlString = ""
        
        do{
            let _ = try await storageRef.putDataAsync(resizedImage, metadata: metadata)
            print("Image saved")
            //image saving
            
            do{
                let imageUrl =  try await storageRef.downloadURL()
                imageUrlString = "\(imageUrl)" //for saving the url in cloud firestore sa a part of the document in the photos collection
            }catch{
                print("could not get image url after saving image ")
                return false
                
            }
        }catch{
            print("error uploading to storage ")
            return false
        }
        
        //now that we have the url of the photo from storage, we save the photo in the document
        
        let collectionString = "recipes/\(recipeID)/photos"
        
        do{
            var newPhoto = photo
            
            newPhoto.imageURLString = imageUrlString
            try await db.collection(collectionString).document(photoName).setData(newPhoto.dictionary)
            print("Data updated weewoo :D")
        }catch{
            print("Wha tthe fuck went wrong IN SAVING IMAGE AAAAAAAAA")
            return false
        }
        
        return true
    }
}
