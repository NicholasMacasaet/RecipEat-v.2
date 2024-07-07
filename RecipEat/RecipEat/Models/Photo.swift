//
//  Photo.swift
//  RecipEat
//
//  Created by Nick on 2024-07-07.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Photo: Identifiable, Codable{
    @DocumentID var id: String?
    
    var imageURLString = ""
    //for loading images
    
    var owner = Auth.auth().currentUser?.uid ?? ""
    
    var recipe=""
    
    var dictionary: [String: Any]{
        return ["imageURL": imageURLString, "owner": owner, "recipe":recipe]
    }
}
