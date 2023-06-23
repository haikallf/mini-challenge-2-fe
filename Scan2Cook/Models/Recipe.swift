//
//  Recipe.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 23/06/23.
//

import SwiftUI

struct Recipe: Equatable, Identifiable {
    let id: String
    let name: String
    let image: String
}

extension Recipe {
    static let all = [
        Recipe(id: "1", name: "Telur Orak Arik", image: "1"),
        Recipe(id: "2", name: "Mie Kocok Kesetanan", image: "2"),
        Recipe(id: "3", name: "Mie Kuah Susus ala Anak Kos", image: "3"),
    ]
}
