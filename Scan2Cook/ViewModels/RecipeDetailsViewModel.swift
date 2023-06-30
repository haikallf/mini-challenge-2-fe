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
    
    let globalStates = GlobalStates()
    
    init(recipeId: String){
        getRecipeById(recipeId: recipeId)
    }
    
    func getRecipeById(recipeId: String) {
        print("recipeId: \(recipeId)")
        
        guard let url = URL(string: "\(globalStates.baseURL)/resep?resepId=\(recipeId)") else {fatalError("URL not found!")}

        let request = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }

            guard let response = response as? HTTPURLResponse else { return }


            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedRecipe = try JSONDecoder().decode([RecipeResponse].self, from: data)
                        self.recipeDetails = decodedRecipe[0]
                        
                        var arr: [String] = []
                        
                        for i in 0..<(self.recipeDetails?.resep_alatmasaks.count ?? 0) {
                            arr.append(self.recipeDetails?.resep_alatmasaks[i].alatmasak.alat_masak ?? "")
                        }
                        self.cookingwares = arr.joined(separator: ", ")
                        
                        print(self.recipeDetails)
                        
                    } catch let error {
                        print("Error decoding: ", error)
                        self.recipeDetails = nil
                    }
                }
            } else {
                self.recipeDetails = nil
            }
        }

        dataTask.resume()
    }
}

