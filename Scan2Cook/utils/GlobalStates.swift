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
    
    func showTabBar() {
        self.isTabBarShown = true
    }
    
    func hideTabBar() {
        self.isTabBarShown = false
    }
    
    func setSelectedPageIndex(value: Int) {
        self.selectedPageIndex = value
    }
}
