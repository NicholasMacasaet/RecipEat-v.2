//
//  User.swift
//  RecipEat
//
//  Created by Nick on 2024-05-16.
//

import Foundation

struct User:Codable{
    
    
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
