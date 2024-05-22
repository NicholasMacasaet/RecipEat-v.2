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
        
        SearchBar()
        
        NavigationView{
            VStack{
                
                
            }
            .navigationTitle("My Recipes")
            .toolbar{
                //action
                
                Button{
                    //action
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
