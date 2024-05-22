//
//  Ingredient.swift
//  RecipEat
//
//  Created by Nick on 2024-05-16.
//

import Foundation

struct Ingredient:Identifiable{
    var id: String
    
    
    
    let name:String
    let fats:Double
    let carbs:Double
    let protein:Double 
    let kcal:Int
}
