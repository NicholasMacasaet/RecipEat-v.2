//
//  PhotoSelectionView.swift
//  RecipEat
//
//  Created by Nick on 2024-07-07.
//

import SwiftUI

struct PhotoSelectionView: View {
//    
   @State private var photo = Photo()
    var uiImage: UIImage
    //pass in recipe from parent view/recipecreationview
    @Environment(\.dismiss) private var dismiss
    
//    @ObservedObject var viewModel
//    
    var body: some View {
        NavigationStack{
            Text("Would you like to add this image to \(photo.recipe)?")
                .font(.largeTitle)
                .fontWeight(.medium)
            
            
            VStack{
                Spacer()
                
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal)
                Spacer()
            }
        }.toolbar{
            ToolbarItem(placement:.cancellationAction){
                Button("Cancel") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .automatic){
                Button("Save"){
                    Task{
                        
                    }
                }
            }
        }
    }
}

#Preview {
    PhotoSelectionView(uiImage: UIImage(named: "Ube") ?? UIImage())
}
