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
        NavigationView{
            //LoginView()
            
            if viewModel.isSignedIn,
               viewModel.currentUserId.isEmpty{
                RecipeDashboardView()
            }else{
                LoginView()
            }
        }
    }
}

#Preview {
    MainView()
}
