//
//  DashboardView.swift
//  RecipEat
//
//  Created by Nick on 2024-05-16.
//

import SwiftUI

struct RecipeDashboardView: View {
    
    
    @StateObject var viewModel = RecipeDashboardViewModel()
    
    
    private let userId: String
    
    init(userId: String){
        self.userId = userId
    }
    
    var body: some View {
        
//        SearchBar()
//        
        NavigationView{
            VStack{
                ForEach(self.viewModel.recipes, id: \.self){
                    i in Button {
                    } label: {
                        Text(i)
                    }
                    
                    
                    /*
                     TODO: have a block that displays the name of the user's recipes along with information about the macros of that recipe
                     
                     TODO: need to make the block navigatable, taking them to a display page that shows the information of the recipe
                     
                     TODO: on the display page we need an edit button that will allow the user to edit the fields we put in as well as a delete button w/ a confirmaton
                     
                     TODO: also give ability to add pictures PLOT TWIST NOW
                     
                     
                     
                     need:
                        -New photo struct for each recipe
                        -identifier that denotes owner of photo or which photo this recipe belongs to (use current userID and name of the recipe to denote ownership)
                     
                     */

                }
                
                
                List(viewModel.recipesUwU, id: \.name) { item in
                           VStack(alignment: .leading) {
                               Text("Name: \(item.name)")
                                   .font(.headline)
                               Text("Protein: \(item.protein)g")
                               Text("Carbs: \(item.carbs)g")
                               Text("Fats: \(item.fats)g")
                               Text("Calories: \(item.kcal) kcal")
                           }
                           .padding()
                       }
                       .navigationTitle("Nutrition Info")

                
                
    

                }
                
                
            }
            .navigationTitle("My Recipes")
            .toolbar{
                //action
               
                    NavigationLink{
                        RecipeCreationView()
                        //print("going to recipe creation view")
                        
                    } label: {
                        Image(systemName:"plus")
                    }.foregroundColor(Color("Ube Purple"))
                
                
            }
            
        }
    }


#Preview {
    RecipeDashboardView(userId: "")
}
