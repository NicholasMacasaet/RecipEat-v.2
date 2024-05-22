//
//  MainView.swift
//  RecipEat
//
//  Created by Nick on 2024-05-16.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        //LoginView()
        if viewModel.isSignedIn,
            !viewModel.currentUserId.isEmpty{
            
            TabView{
                RecipeDashboardView(userId: viewModel.currentUserId )
                    .tabItem{
                        Label("Home", systemImage: "house")
                    }
                
                ProfileView()
                    .tabItem{
                        Label("Profile", systemImage: "person.circle")
                    }
            }
            
           
            
        }else{
            LoginView()
        }
        
    }
}

#Preview {
    MainView()
}
