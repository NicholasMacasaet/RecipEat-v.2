//
//  SearchBar.swift
//  RecipEat
//
//  Created by Nick on 2024-05-22.
//

import SwiftUI

struct SearchBar: View {
    
    //@StateObject var viewModel = SearchBarViewModel()
    
    
    
    //@Binding var test: String
    
    
    @State var search = ""
    
    @ObservedObject var ingredientData = SearchBarViewModel()
    
    @Binding var ingredientName: String
    @Binding var ingredientProtein: Double
    @Binding var ingredientFats: Double
    @Binding var ingredientCarbs: Double
    @Binding var kcal:Int
    
   
    var body: some View {
    
//        print("Saved ingredient Name: \(ingredientName)")
//        print("Saved ingredient Protein: \(ingredientProtein)")
//        print("Saved ingredient Fats: \(ingredientFats)")
//        print("Saved ingredient Carbs: \(ingredientCarbs)")
//        
        
        NavigationView{
            List{
                ForEach(self.ingredientData.ingredients.filter{(self.search.isEmpty ? true: $0.name.localizedCaseInsensitiveContains(self.search))}, id: \.id){ i in
                    Button{
                        //do a thinga mabob
                        self.ingredientName = i.name
                        self.ingredientProtein = i.protein
                        self.ingredientFats = i.fats
                        self.ingredientCarbs = i.carbs
                        self.kcal = i.kcal
                        
                        print("Saved ingredient Name: \(ingredientName)")
                        print("Saved ingredient Protein: \(ingredientProtein)")
                        print("Saved ingredient Fats: \(ingredientFats)")
                        print("Saved ingredient Carbs: \(ingredientCarbs)")
                        
                        //self.test = i.name
                    } label: {
                        VStack{
                            Text(i.name)
                            HStack{
                                Text("Calories:\(i.kcal)")
                                Text("Fats: \(i.fats)")
                                Text("Carbs: \(i.carbs)")
                                Text("Protein: \(i.protein)")
                            }
                        }
                    }
                
                }
            }.navigationTitle("Find Ingredients")
        }.searchable(text: $search)
        
    }
    
}

#Preview {
    SearchBar(ingredientName: .constant(""), ingredientProtein: .constant(0.0), ingredientFats: .constant(0.0), ingredientCarbs: .constant(0.0), kcal:  .constant(0))
}
