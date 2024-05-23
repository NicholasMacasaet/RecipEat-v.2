//
//  RecipeCreationView.swift
//  RecipEat
//
//  Created by Nick on 2024-05-16.
//

import SwiftUI

struct RecipeCreationView: View {
    
    //let test = ""
    
    
    
    
    @State var ingredientName = ""
    @State var ingredientProtein = 0.0
    @State var ingredientFats = 0.0
    @State var ingredientCarbs = 0.0
    @State var kcal = 0
    
    var body: some View {
        
        
        
        SearchBar(ingredientName: self.$ingredientName, ingredientProtein:self.$ingredientProtein, ingredientFats: self.$ingredientFats, ingredientCarbs: self.$ingredientCarbs, kcal: self.$kcal)
        
        
        
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
