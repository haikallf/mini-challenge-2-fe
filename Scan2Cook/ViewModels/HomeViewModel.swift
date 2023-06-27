//
//  HomeViewModel.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 23/06/23.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var sectionedRecipes: [SectionedRecipes]
    
    let userDefaults = UserDefaults.standard
    let lastSeenRecipesKey = "lastSeenRecipes"
    
    init(){
        sectionedRecipes = SectionedRecipes.all
    }
}
