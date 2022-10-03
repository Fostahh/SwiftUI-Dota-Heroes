//
//  Hero.swift
//  DotaHeroes
//
//  Created by Mohammad Azri on 03/10/22.
//

import Foundation

struct Hero: Codable, Hashable {
    let id : Int
    let name : String
    let attribute: PrimaryAttribute
    
    enum CodingKeys : String, CodingKey {
        case id
        case name = "localized_name"
        case attribute = "primary_attr"
    }
}

enum PrimaryAttribute : String, Codable {
    case agi = "agi"
    case int = "int"
    case str = "str"
}
