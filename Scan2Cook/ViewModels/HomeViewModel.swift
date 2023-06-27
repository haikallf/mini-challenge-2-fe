//
//  HomeViewModel.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 23/06/23.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var sectionedRecipes: [SectionedRecipes]
    @Published var username: String
    
    let userDefaults = UserDefaults.standard
    let lastSeenRecipesKey = "lastSeenRecipes"
    let usernameKey = "username"
    
    init(){
        sectionedRecipes = SectionedRecipes.all
        username = userDefaults.string(forKey: usernameKey) ?? "Bre"
    }
}
