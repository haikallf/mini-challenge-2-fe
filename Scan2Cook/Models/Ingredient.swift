//
//  Ingredient.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 23/06/23.
//

import SwiftUI

struct Ingredient: Equatable, Identifiable {
    let id: String
}

extension Ingredient {
    static let all = [
        "bawang merah",
        "telur",
        "tomat",
        "daun bawang",
        "indomie",
        "jagung",
        "pakcoy",
        "roti",
        "bawang putih",
    ]
}
