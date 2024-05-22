//
//  Recipe.swift
//  RecipEat
//
//  Created by Nick on 2024-05-16.
//

import Foundation


struct Recipe:Codable{
    
 
    let name: String
    let protein: Double
    let fats: Double
    let carbs: Double
    
    let directions: String
    
    let ingredients: [String: Int]
    /*denotes specific Recipe name and quantity of the ingredients,
    adds this to a Recipe if it doesnt exist , or increment the
    count if it is */
}
