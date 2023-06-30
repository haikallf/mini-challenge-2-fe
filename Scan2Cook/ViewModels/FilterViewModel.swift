//
//  FilterViewModel.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi on 27/06/23.
//

import SwiftUI

class FilterViewModel: ObservableObject {
    @Published var cookingWare: [String]
    @Published var cookingTime: [String]
    @Published var ingredientsCount: [String]
    //Cookingware, cooking time,
    let userDefaults = UserDefaults.standard
//    let personalizationsKey = "personalizations"
//    let personalizationFilterKey = "personalizationFilter"
//    let cookingWareKey = "cookingWare"
//    let cookingTimeKey = "cookingTime"
//    let ingredientsCountKey = "ingredientsCount"
    
    init() {
        cookingWare = []
        cookingTime = []
        ingredientsCount = []
    }
    
    func updateCookingWare(value: String) {
        if (self.cookingWare.contains(value)) {
            self.cookingWare = self.cookingWare.filter { $0 != value }
        } else {
            self.cookingWare.append(value)
        }
    }
    
    func updateCookingTime(value: String) {
        if (self.cookingTime.contains(value)) {
            self.cookingTime = self.cookingTime.filter { $0 != value }
        } else {
            self.cookingTime.append(value)
        }
    }
    
    func updateIngredientsCount(value: String) {
        if (self.ingredientsCount.contains(value)) {
            self.ingredientsCount = self.ingredientsCount.filter { $0 != value }
        } else {
            self.ingredientsCount.append(value)
        }
    }
}
