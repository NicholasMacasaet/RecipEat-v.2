//
//  SearchBar.swift
//  RecipEat
//
//  Created by Nick on 2024-05-22.
//

import SwiftUI

struct SearchBar: View {
    
    //@StateObject var viewModel = SearchBarViewModel()

    
    
    @State var search = ""
    
    @ObservedObject var ingredientData = SearchBarViewModel()
    
    
    var body: some View {
        
        NavigationView{
            
            List{
                ForEach(self.ingredientData.ingredients.filter{(self.search.isEmpty ? true: $0.name.localizedCaseInsensitiveContains(self.search))}, id: \.id){ i in
                    
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
            }.navigationTitle("Find Ingredients")
        }.searchable(text: $search)
        
    }
}

#Preview {
    SearchBar()
}
