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
}

extension Ingredient {
    static let all = [
        Ingredient(id: "BAWANG_MERAH", name: "Bawang Merah"),
        Ingredient(id: "TELUR", name: "Telur"),
        Ingredient(id: "INDOMIE", name: "Indomie"),
        Ingredient(id: "JAGUNG", name: "Jagung"),
        Ingredient(id: "PAKCOY", name: "Pakcoy"),
        Ingredient(id: "ROTI", name: "Roti"),
        Ingredient(id: "BAWANG_PUTIH", name: "Bawang Putih"),
    ]
}
