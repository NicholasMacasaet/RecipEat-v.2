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
}

#Preview {
    RecipeDashboardView(userId: "")
}
