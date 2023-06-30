//
//  HomeViewModel.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 23/06/23.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var newestRecipes: [RecipeThumbnailResponse]
    @Published var todaysRecipe: [RecipeThumbnailResponse]
    @Published var username: String
    
    let userDefaults = UserDefaults.standard
    let lastSeenRecipesKey = "lastSeenRecipes"
    let usernameKey = "username"
    let personalizationsKey = "personalizations"
    let globalStates = GlobalStates()
    
    init(){
        newestRecipes = []
        todaysRecipe = []
        username = userDefaults.string(forKey: usernameKey) ?? "Bre"
        
        Task { [weak self] in
            await self?.getNewestRecipes(checkLocalStorage: true)
        }
        Task { [weak self] in
            await self?.getTodaysRecipes(checkLocalStorage: true)
        }
    }
    
    func getTodaysRecipes(personalizations: [String] = [], cookingWare: [String] = [], cookingTime: [String] = [], ingredientsCount: [String] = [], checkLocalStorage: Bool = false) async {
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
        
        let recipeIds = ["8", "9", "10", "11", "12", "13", "14", "15"].joined(separator: ",")
        let personalizationsStr = temp.joined(separator: ",")
        let cookingTimeStr = cookingTime.joined(separator: ",")
        let cookingWareStr = cookingWare.joined(separator: ",")
        let ingredientsCount = ingredientsCount.joined(separator: ",")
        
        guard let url = URL(string: "\(globalStates.baseURL)/resep?resepId=\(recipeIds)&personalisasiOrang=\(personalizationsStr)&alatMasak=\(cookingWareStr)&waktuPembuatan=\(cookingTimeStr)") else { fatalError("URL not found!") }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse else { return }
            
            if httpResponse.statusCode == 200 {
                DispatchQueue.main.async {
                    do {
                        let decodedRecipe = try JSONDecoder().decode([RecipeThumbnailResponse].self, from: data)
                        self.todaysRecipe = decodedRecipe
                        
                    } catch let error {
                        print("Error decoding: ", error)
                        self.todaysRecipe = []
                    }
                }
            } else {
                self.todaysRecipe = []
            }
        } catch {
            print("Request error: ", error)
//            self.todaysRecipe = []
        }
    }
    
    func getNewestRecipes(personalizations: [String] = [], cookingWare: [String] = [], cookingTime: [String] = [], ingredientsCount: [String] = [], checkLocalStorage: Bool = true) async {
        
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
        
        let recipeIds = ["1", "2", "3", "4", "5", "6", "7"].joined(separator: ",")
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
                        self.newestRecipes = decodedRecipe
                        
                    } catch let error {
                        print("Error decoding: ", error)
//                        self.newestRecipes = []
                    }
                }
            } else {
//                self.newestRecipes = []
            }
        } catch {
            print("Request error: ", error)
//            self.newestRecipes = []
        }
    }
}
