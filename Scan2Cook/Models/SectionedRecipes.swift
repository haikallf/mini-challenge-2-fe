//
//  SectionedRecipes.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi on 26/06/23.
//

import SwiftUI

struct SectionedRecipes: Equatable, Identifiable, Decodable {
    let id: String
    let name: String
    let description: String?
    let recipes: [Recipe]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case recipes
    }
    
    init(id: String, name: String, description: String?, recipes: [Recipe]) {
        self.id = id
        self.name = name
        self.description = description
        self.recipes = recipes
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        recipes = try container.decode([Recipe].self, forKey: .recipes)
    }
}

extension SectionedRecipes {
    static let all = [
        SectionedRecipes(id: "1", name: "Resep Hari Ini", description: nil, recipes: Recipe.all),
        SectionedRecipes(id: "2", name: "Resep Terbaru", description: nil, recipes: Recipe.all),
    ]
}
