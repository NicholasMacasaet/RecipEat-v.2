//
//  PhotoSelectionView.swift
//  RecipEat
//
//  Created by Nick on 2024-07-07.
//

import SwiftUI

struct PhotoSelectionView: View {
//    
//    @State private var photo = Photo()
    var uiImage: UIImage
    
    var body: some View {
    
        
        NavigationStack{
            Text("Add photo to recipe:")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            
            
            VStack{
                Spacer()
                
                
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                
                
                Spacer()
            }
            
            
        }
        
        
    }
}

#Preview {
    PhotoSelectionView(uiImage: UIImage(named: "Ube") ?? UIImage())
}
