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
    
    
    //var result: Bool
    init(){
        
        
        _viewModel = ObservedObject(wrappedValue: RecipeCreationViewModel(
            ingredientName: "", ingredientProtein: 0.0, ingredientFats: 0.0, ingredientCarbs: 0.0, kcal: 0)
        )
    }
    
    var body: some View {
        
        
        VStack{
            
         
            /*
             this component, when clicked, automatically adds the information of the selected ingredient to the state variables above
             
             TODO: when the state variables change, we update the information in the view model as needed
             */
           
            
            ScrollView{
                SearchBar(ingredientName: self.$ingredientName, ingredientProtein:self.$ingredientProtein, ingredientFats: self.$ingredientFats, ingredientCarbs: self.$ingredientCarbs, kcal: self.$kcal)
            }.frame(height: UIScreen.main.bounds.height / 3)
                
            
            
            /*
             TODO: (2)
             here we'll put a small text box displaying the name of the selected ingredient and we can add three buttons, two to increase or decrease the quantity of ingredients to add and a third to add it to the recipe via calling the addIngredients() function, this function initially adds the ingredient for selection
             
             
             TODO: (3)
             for the decrease button, if we reach zero then we clear the selected ingredient from the text box selection and from the state variables, call the clearPrimitives() method here
             I'm thinking it would be [inc button]  [dec button] [add to recipe]
             */
      
            if(!ingredientName.isEmpty){
                HStack{
                    Text("Selected Ingredient: \(viewModel.ingredientName) (\(viewModel.quantity))")
                        .font(.system(size: 12))
                        
                    
                    REButton(title: "-", background: Color("Ube Purple")){
                        viewModel.quantity = viewModel.quantity - 1
                    }.frame(width: 80 ,height: 90)
                    
                
                    
                    REButton(title: "+", background: Color("Ube Purple")){
                        viewModel.quantity = viewModel.quantity + 1
                    }.frame(width: 80 ,height: 90)
                    
                    
                    REButton(title: "Add to recipe", background: Color("Ube Purple")){
                        viewModel.addIngredients()
                        
                        viewModel.clearPrimitives()
                        
                        ingredientName = ""
                        ingredientProtein = 0.0
                        ingredientFats = 0.0
                        ingredientCarbs = 0.0
                        kcal = 0
                    }.frame(width: 100 ,height: 100)
                                        
    
                }
                    .frame(height: 75)
            }
            
            
            
            /*
             TODO: (4)
             Here we would render all the ingredients that are in the recipe via iterating over the internal dictionary. Since the key of the dict is the name of the ingredient and the value is the quantity it should be simple enough
             */
            
            
    
            
            
            /*
             TODO: (5)
             Here we'll put two text fields, one for the name and one for the description so the user can add the instructions for the recipe and the name
             
             */
            TextField("Input recipe name", text: $viewModel.recipeName).bold()
                .font(.system(size:25))
                .foregroundColor(Color("Ube Purple"))
                .padding(.top,10)
                .padding(.bottom,10)
            
            
            TextField("How do you make your recipe ?", text:$viewModel.recipeDirections).bold()
                .font(.system(size:20))
                
           
            List(viewModel.newRecipe.ingredients.sorted(by: { $0.key < $1.key }), id: \.key) { key, value in
                       HStack {
                           Text("Ingredient: \(key)")
                           Spacer()
                           Text("Quantity: \(value)")
                       }
                   }
            
            
            
            REButton(title:"Add Recipe", background: Color("Ube Purple")){
                
                viewModel.registerRecipe()
            }
            .frame(width: UIScreen.main.bounds.width/2, height: UIScreen.main.bounds.width/4)
            
            
            
            Spacer()
        
//            Text(viewModel.ingredientName)
//            Text("\(viewModel.ingredientProtein)")
//            Text("\(viewModel.ingredientFats)")
//            Text("\(viewModel.ingredientCarbs)")
//            Text("\(viewModel.kcal)")
                
            
        }.onChange(of: ingredientName) { 
            viewModel.ingredientName = ingredientName}
        
        .onChange(of: ingredientProtein) {
            viewModel.ingredientProtein = ingredientProtein}
        
        .onChange(of: ingredientFats) {
            viewModel.ingredientFats = ingredientFats}
        
        .onChange(of: ingredientCarbs) {
            viewModel.ingredientCarbs = ingredientCarbs}
        .onChange(of: kcal) {
            viewModel.kcal = kcal}
        
    }
}

#Preview {
    RecipeCreationView()
}
