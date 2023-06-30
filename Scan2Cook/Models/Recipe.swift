//
//  Recipe.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 23/06/23.
//

import SwiftUI

struct Recipe: Equatable, Identifiable, Decodable {
    let id: String
    let name: String
    let image: String
    let tags: [String]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case image
        case tags
    }
    
    init(id: String, name: String, image: String, tags: [String]) {
        self.id = id
        self.name = name
        self.image = image
        self.tags = tags
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        image = try container.decode(String.self, forKey: .image)
        tags = try container.decode([String].self, forKey: .tags)
    }
}

extension Recipe {
    static let all = [
        Recipe(id: "1", name: "Telur Orak Arik", image: "1", tags: []),
        Recipe(id: "2", name: "Mie Kocok Kesetanan", image: "2", tags: []),
        Recipe(id: "3", name: "Mie Kuah Susus ala Anak Kosan Irit Parah Banget Cok", image: "3", tags: ["laktosa", "pedas"]),
    ]
}
