//
//  HomeViewModel.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 23/06/23.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var newestRecipes: [RecipeResponse]
    @Published var todaysRecipe: [RecipeResponse]
    @Published var username: String
    
    let userDefaults = UserDefaults.standard
    let lastSeenRecipesKey = "lastSeenRecipes"
    let usernameKey = "username"
    let globalStates = GlobalStates()
    
    init(){
        newestRecipes = []
        todaysRecipe = []
        username = userDefaults.string(forKey: usernameKey) ?? "Bre"
        
        Task { [weak self] in
            await self?.getNewestRecipes()
        }
        Task { [weak self] in
            await self?.getTodaysRecipes()
        }
    }
    
//    func getSectionedRecipes() {
//        guard let url = URL(string: "\(globalStates.baseURL)/resep") else {fatalError("URL not found!")}
//
//        let request = URLRequest(url: url)
//
//        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
//            if let error = error {
//                print("Request error: ", error)
//                return
//            }
//
//            guard let response = response as? HTTPURLResponse else { return }
//
//
//            if response.statusCode == 200 {
//                guard let data = data else { return }
//                DispatchQueue.main.async {
//                    do {
//                        let decodedRecipes = try JSONDecoder().decode([SectionedRecipes].self, from: data)
//                        self.sectionedRecipes = decodedRecipes
//                    } catch let error {
//                        print("Error decoding: ", error)
//                    }
//                }
//            }
//        }
//
//        dataTask.resume()
//    }
    
    func getSectionedRecipes() {
        guard let url = URL(string: "\(globalStates.baseURL)/resep") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                DispatchQueue.main.async {
                    print(error.localizedDescription)
                }
                return
            }
            
            // Process the response data if needed
            // For example, you can convert the data to a string
            if let data = data {
                print(data)
//                let responseString = String(data: data, encoding: .utf8)
//                print(responseString)
            }
        }
        .resume()
    }
    
    func getTodaysRecipes() async {
        let recipeIds = ["4", "5", "6"].joined(separator: ",")
        
        guard let url = URL(string: "\(globalStates.baseURL)/resep?resepId=\(recipeIds)") else { fatalError("URL not found!") }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse else { return }
            
            if httpResponse.statusCode == 200 {
                DispatchQueue.main.async {
                    do {
                        let decodedRecipe = try JSONDecoder().decode([RecipeResponse].self, from: data)
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
            self.todaysRecipe = []
        }
    }
    
    func getNewestRecipes() async {
        let recipeIds = ["1", "2", "3"].joined(separator: ",")
        
        guard let url = URL(string: "\(globalStates.baseURL)/resep?resepId=\(recipeIds)") else { fatalError("URL not found!") }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse else { return }
            
            if httpResponse.statusCode == 200 {
                DispatchQueue.main.async {
                    do {
                        let decodedRecipe = try JSONDecoder().decode([RecipeResponse].self, from: data)
                        self.newestRecipes = decodedRecipe
                        
                    } catch let error {
                        print("Error decoding: ", error)
                        self.newestRecipes = []
                    }
                }
            } else {
                self.newestRecipes = []
            }
        } catch {
            print("Request error: ", error)
            self.newestRecipes = []
        }
    }
}
