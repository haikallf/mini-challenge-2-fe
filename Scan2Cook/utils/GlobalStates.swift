//
//  GlobalStates.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 23/06/23.
//

import SwiftUI

class GlobalStates: ObservableObject {
    @Published var isTabBarShown: Bool = true
    @Published var selectedPageIndex: Int = 1
    @Published var baseURL: String = "http://192.168.100.26:3000"
    
    @Published var personalizationsFilter: [String] = UserDefaults.standard.stringArray(forKey: "personalizations") ?? []
    @Published var cookingWareFilter: [String] = []
    @Published var cookingTimeFilter: [String] = []
    @Published var ingredientsCountFilter: [String] = []
    
    let allPersonalizations = ["1", "2", "3", "4"]
    
    func showTabBar() {
        self.isTabBarShown = true
    }
    
    func hideTabBar() {
        self.isTabBarShown = false
    }
    
    func setSelectedPageIndex(value: Int) {
        self.selectedPageIndex = value
    }
    
    func updateFilters(personalizationFilter: [String], cookingWareFilter: [String], cookingTimeFilter: [String], ingredientsCountFilter: [String]) {
        print("initial filter: \(personalizationFilter)")
        var temp: [String] = []
        
        //Subtract the array (FE: Black listing. BE White listing)
        if !personalizationFilter.isEmpty{
            for elmt in allPersonalizations {
                if !personalizationFilter.contains(elmt) {
                    temp.append(elmt)
                }
            }
        }
        
        self.personalizationsFilter = temp
        self.cookingTimeFilter = cookingTimeFilter
        self.cookingWareFilter = cookingWareFilter
        self.ingredientsCountFilter = ingredientsCountFilter
    }
}
