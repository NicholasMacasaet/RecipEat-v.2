//
//  RecipeCreationView.swift
//  RecipEat
//
//  Created by Nick on 2024-05-16.
//

import SwiftUI

struct RecipeCreationView: View {
    
    
    
    
    
//    @State var ingredientName = ""
//    @State var ingredientProtein = 0.0
//    @State var ingredientFats = 0.0
//    @State var ingredientCarbs = 0.0
//    @State var kcal = 0
    
    /*
     state variables for search bar view
     */
    @State private var ingredientName = ""
    @State private var ingredientProtein = 0.0
    @State private var ingredientFats = 0.0
    @State private var ingredientCarbs = 0.0
    @State private var kcal = 0
    
    @ObservedObject var viewModel: RecipeCreationViewModel
    
//    viewModel.$ingredientName
    
    init(){
        
        
        _viewModel = ObservedObject(wrappedValue: RecipeCreationViewModel(
            ingredientName: "", ingredientProtein: 0.0, ingredientFats: 0.0, ingredientCarbs: 0.0, kcal: 0)
        )
    }
    
    var body: some View {
        
        /*
         this component, when clicked, automatically adds the information of the selected ingredient to the state variables above
         
         TODO: when the state variables change, we update the information in the view model as needed
         */
        SearchBar(ingredientName: self.$ingredientName, ingredientProtein:self.$ingredientProtein, ingredientFats: self.$ingredientFats, ingredientCarbs: self.$ingredientCarbs, kcal: self.$kcal)
        

        
        
        /*
         TODO: (2)
         here we'll put a small text box displaying the name of the selected ingredient and we can add three buttons, two to increase or decrease the quantity of ingredients to add and a third to add it to the recipe via calling the addIngredients() function, this function initially adds the ingredient for selection
         
         
         TODO: (3)
         for the decrease button, if we reach zero then we clear the selected ingredient from the text box selection and from the state variables, call the clearPrimitives() method here
             I'm thinking it would be [inc button]  [dec button] [add to recipe]
         */
        
        
        /*
         TODO: (4)
         Here we would render all the ingredients that are in the recipe via iterating over the internal dictionary. Since the key of the dict is the name of the ingredient and the value is the quantity it should be simple enough
         */
        
        
        
        /*
         TODO: (5)
         Here we'll put two text fields, one for the name and one for the description so the user can add the instructions for the recipe and the name
         
         */
        
        
        
//        Text(ingredientName)
//        Text("\(ingredientProtein)")
//        Text("\(ingredientFats)")
//        Text("\(ingredientCarbs)")
//        Text("\(kcal)")
    }
}

#Preview {
    RecipeCreationView()
}
