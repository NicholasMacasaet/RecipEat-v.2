//
//  Recipe.swift
//  RecipEat
//
//  Created by Nick on 2024-05-16.
//

import Foundation


struct Recipe: Codable{
    
 
    var name: String
    
    var protein: Double
    var fats: Double
    var carbs: Double
    
    var kcal: Int
    
    var directions: String
    
    var ingredients: [String: Int]
    /*denotes specific Recipe name and quantity of the ingredients,
    adds this to a Recipe if it doesnt exist , or increment the
    count if it is */
    
    
    var owner: String
    /*
     denotes the user that owns this recipe 
     */

}
