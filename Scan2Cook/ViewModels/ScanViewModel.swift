//
//  ScanViewModel.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 23/06/23.
//

import SwiftUI

class ScanViewModel: ObservableObject {
    @Published var ingredients: [Ingredient]
    @Published var selectedIngredients: [Ingredient]
    @Published var searchText: String = ""
    @Published var lastSeenRecipeIds: [String]
    @Published var lastSeenRecipes: [RecipeThumbnailResponse]
    @Published var image : UIImage = UIImage()
    
    let userDefaults = UserDefaults.standard
    let lastSeenRecipesKey = "lastSeenRecipesIds"
    let personalizationsKey = "personalizations"
    let globalStates = GlobalStates()
    
    init(){
        self.ingredients = Ingredient.all
        self.selectedIngredients = []
        self.lastSeenRecipeIds = userDefaults.stringArray(forKey: lastSeenRecipesKey) ?? []
        self.lastSeenRecipes = []
        
        Task { [weak self] in
            await self?.getLastSeenRecipes(checkLocalStorage: true)
        }
    }
    
    var filteredIngredients: [Ingredient] {
        
        guard !self.searchText.isEmpty else { return ingredients }
        
        let ingredientsTemp = ingredients.filter { ingredient in
            ingredient.name.lowercased().contains(self.searchText.lowercased())
        }
        
        return Array(ingredientsTemp)
    }
    
    func updateSelectedIngredients(ingredient: Ingredient) {
        if (self.selectedIngredients.contains(ingredient)) {
            self.selectedIngredients = self.selectedIngredients.filter { $0 != ingredient }
        } else {
            self.selectedIngredients.append(ingredient)
        }
    }
    

    func setSelectedIngredients(ingredients : [Ingredient]){
        self.selectedIngredients = ingredients
    }
    
    func resetIngredientsSelection() {
        self.ingredients = Ingredient.all
        self.selectedIngredients = []
    }
    
    func setImage(image : UIImage){
        self.image = image
    }
    func getLastSeenRecipes(personalizations: [String] = [], cookingWare: [String] = [], cookingTime: [String] = [], ingredientsCount: [String] = [], checkLocalStorage: Bool = false) async {
        
        var temp: [String] = []
        
        //Subtract the array (FE: Black listing. BE White listing)
        if (checkLocalStorage == true) {
            var storagePersonalizations: [String] = []
            storagePersonalizations = userDefaults.stringArray(forKey: personalizationsKey) ?? []
            if (!storagePersonalizations.isEmpty) {
                for elmt in globalStates.allPersonalizations {
                    if !storagePersonalizations.contains(elmt) {
                        temp.append(elmt)
                    }
                }
            }
        } else {
            if (!personalizations.isEmpty) {
                for elmt in globalStates.allPersonalizations {
                    if !personalizations.contains(elmt) {
                        temp.append(elmt)
                    }
                }
            }
        }
        
        let recipeIds = self.lastSeenRecipeIds.joined(separator: ",")
        let personalizationsStr = temp.joined(separator: ",")
        let cookingTimeStr = cookingTime.joined(separator: ",")
        let cookingWareStr = cookingWare.joined(separator: ",")
        let ingredientsCount = ingredientsCount.joined(separator: ",")
        
        guard let url = URL(string: "\(globalStates.baseURL)/resep?resepId=\(recipeIds)&personalisasiOrang=\(personalizationsStr)&alatMasak=\(cookingWareStr)&waktuPembuatan=\(cookingTimeStr)") else { fatalError("URL not found!") }
        
        print(url)
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse else { return }
            
            if httpResponse.statusCode == 200 {
                DispatchQueue.main.async {
                    do {
                        let decodedRecipe = try JSONDecoder().decode([RecipeThumbnailResponse].self, from: data)
                        self.lastSeenRecipes = decodedRecipe
                        
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            } else {
            }
        } catch {
            print("Request error: ", error)
        }
    }
}
