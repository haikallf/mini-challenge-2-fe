//
//  RecipeDetailsViewModel.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 30/06/23.
//

import SwiftUI

class RecipeDetailsViewModel: ObservableObject {
    @Published var recipeDetails: RecipeResponse?
    @Published var cookingwares: String = ""
    
    let userDefaults = UserDefaults.standard
    let globalStates = GlobalStates()
    let bookmarkedRecipesKey = "bookmarkedRecipesIds"
    
    init(recipeId: String) {
        Task {
            await getRecipeById(recipeId: recipeId)
        }
    }
    
    func getRecipeById(recipeId: String) async {
        print("recipeId: \(recipeId)")
        
        guard let url = URL(string: "\(globalStates.baseURL)/resep?resepDetailId=\(recipeId)") else { fatalError("URL not found!") }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse else { return }
            
            if httpResponse.statusCode == 200 {
                DispatchQueue.main.async {
                    do {
                        let decodedRecipe = try JSONDecoder().decode([RecipeResponse].self, from: data)
                        self.recipeDetails = decodedRecipe[0]
                        
                        var arr: [String] = []
                        
                        for i in 0..<(self.recipeDetails?.resep_alatmasaks.count ?? 0) {
                            arr.append(self.recipeDetails?.resep_alatmasaks[i].alatmasak.alat_masak ?? "")
                        }
                        self.cookingwares = arr.joined(separator: ", ")
                        
                    } catch let error {
                        print("Error decoding: ", error)
                        self.recipeDetails = nil
                    }
                }
            } else {
                self.recipeDetails = nil
            }
        } catch {
            print("Request error: ", error)
        }
    }
}

