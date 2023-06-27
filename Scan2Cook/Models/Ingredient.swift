//
//  Ingredient.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 23/06/23.
//

import SwiftUI

struct Ingredient: Equatable, Identifiable, Hashable {
    let id: String
    let name: String
    let attribute: String?
}

extension Ingredient {
    static let all = [
        Ingredient(id: "BAWANG_MERAH", name: "Bawang Merah", attribute: ""),
        Ingredient(id: "TELUR", name: "Telur", attribute: ""),
        Ingredient(id: "INDOMIE", name: "Indomie", attribute: ""),
        Ingredient(id: "JAGUNG", name: "Jagung", attribute: ""),
        Ingredient(id: "PAKCOY", name: "Pakcoy", attribute: ""),
        Ingredient(id: "ROTI", name: "Roti", attribute: ""),
        Ingredient(id: "BAWANG_PUTIH", name: "Bawang Putih", attribute: ""),
    ]
}
