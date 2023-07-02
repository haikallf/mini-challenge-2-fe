//
//  SearchResultView.swift
//  Scan2Cook
//
//  Created by Kevin Dallian on 02/07/23.
//

import Foundation
import SwiftUI

class SearchResultViewModel : ObservableObject{
    @Published var recipeResults : [RecipeThumbnailResponse] = []
    let personalizationsKey = "personalizations"
    let userDefaults = UserDefaults.standard
    var ingredients : [Ingredient] = []
    var ingredientStr : [String] = []
    var globalStates = GlobalStates()
    
    
    func getRecipeResults(personalizations: [String] = [], checkLocalStorage: Bool = false) async {
        print("getRecipeResults")
        var temp : [String] = []
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
        let personalizationsStr = temp.joined(separator: ",")
        print(ingredientStr)
        let bahanStr = ingredientStr.joined(separator: ",")
        
        guard let url = URL(string: "\(globalStates.baseURL)/resep?personalisasiOrang=\(personalizationsStr)&resepByBahan=\(bahanStr)") else { fatalError("URL not found!") }
        
        print(url)
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse else { return }
            
            if httpResponse.statusCode == 200 {
                DispatchQueue.main.async {
                    do {
                        let decodedRecipe = try JSONDecoder().decode([RecipeThumbnailResponse].self, from: data)
                        self.recipeResults = decodedRecipe
                        print(self.recipeResults)
                    } catch let error {
                        print("Error decoding: ", error)
                        self.recipeResults = []
                    }
                }
            } else {
                self.recipeResults = []
            }
        } catch {
            print("Request error: ", error)
        }
    }
    
    func convertIngredient(ingredients: [Ingredient]) {
        for ingredient in ingredients {
            if ingredient.id == "TOMAT" {
                ingredientStr.append("1")
            } else if ingredient.id == "MIE_INSTANT"{
                ingredientStr.append("2")
                print("append mie instan")
            }else if ingredient.id == "TELUR"{
                ingredientStr.append("3")
            }else if ingredient.id == "SAUS_PEDAS"{
                ingredientStr.append("4")
            }else if ingredient.id == "KECAP"{
                ingredientStr.append("5")
            }else if ingredient.id == "KANGKUNG"{
                ingredientStr.append("6")
            }else if ingredient.id == "KALDU_BUBUK"{
                ingredientStr.append("7")
            }else if ingredient.id == "KENCUR"{
                ingredientStr.append("8")
            }else if ingredient.id == "JAGUNG"{
                ingredientStr.append("9")
            }else if ingredient.id == "DAUN_BAWANG"{
                ingredientStr.append("10")
            }else if ingredient.id == "DAGING_AYAM"{
                ingredientStr.append("11")
            }else if ingredient.id == "CABAI"{
                ingredientStr.append("12")
            }else if ingredient.id == "BAYAM"{
                ingredientStr.append("13")
            }else if ingredient.id == "BAWANG_PUTIH"{
                ingredientStr.append("14")
            }else if ingredient.id == "BAWANG_MERAH"{
                ingredientStr.append("15")
            }else if ingredient.id == "WORTEL"{
                ingredientStr.append("16")
            }else if ingredient.id == "UDANG"{
                ingredientStr.append("17")
            }else if ingredient.id == "TERONG"{
                ingredientStr.append("18")
            }else if ingredient.id == "TERASI"{
                ingredientStr.append("19")
            }else if ingredient.id == "TEMPE"{
                ingredientStr.append("20")
            }else if ingredient.id == "TAOGE"{
                ingredientStr.append("21")
            }else if ingredient.id == "TAHU"{
                ingredientStr.append("22")
            }else if ingredient.id == "SUSU"{
                ingredientStr.append("23")
            }else if ingredient.id == "SPAGHETTI"{
                ingredientStr.append("24")
            }else if ingredient.id == "SOSIS"{
                ingredientStr.append("25")
            }else if ingredient.id == "SAWI_PUTIH"{
                ingredientStr.append("26")
            }else if ingredient.id == "PAKCOY"{
                ingredientStr.append("27")
            }else if ingredient.id == "MENTEGA"{
                ingredientStr.append("28")
            }else if ingredient.id == "MACARONI"{
                ingredientStr.append("29")
            }else if ingredient.id == "LABU"{
                ingredientStr.append("30")
            }else if ingredient.id == "KACANG_PANJANG"{
                ingredientStr.append("31")
            }else if ingredient.id == "JERUK_NIPIS"{
                ingredientStr.append("32")
            }else if ingredient.id == "JAMUR"{
                ingredientStr.append("33")
            }else if ingredient.id == "SELEDRI"{
                ingredientStr.append("34")
            }else if ingredient.id == "CAISIM"{
                ingredientStr.append("35")
            }else if ingredient.id == "BAWANG_BOMBAY"{
                ingredientStr.append("36")
            }
        }
    }
    
    func setIngredients(ingredients: [Ingredient]){
        self.ingredients = ingredients
    }
}
