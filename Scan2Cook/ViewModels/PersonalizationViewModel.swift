//
//  PersonalizationViewModel.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 21/06/23.
//

import SwiftUI

class PersonalizationViewModel: ObservableObject {
    @Published var personalizations: [String]
    @Published var username: String
    
    let userDefaults = UserDefaults.standard
    let personalizationsKey = "personalizations"
    let usernameKey = "username"
    
    init() {
        personalizations = userDefaults.stringArray(forKey: personalizationsKey) ?? []
        username = userDefaults.string(forKey: usernameKey) ?? ""
    }
    
    func setPersonalizations() {
        userDefaults.set(self.personalizations, forKey: personalizationsKey)
    }
    
    func setUsername() {
        userDefaults.set(self.username, forKey: usernameKey)
    }
    
    func updatePersonalizations(personalization: String) {
        if (self.personalizations.contains(personalization)) {
            self.personalizations = self.personalizations.filter { $0 != personalization }
        } else {
            self.personalizations.append(personalization)
        }
    }
    
    func clearPersonalization() {
        userDefaults.set([] as [String], forKey: personalizationsKey)
    }
}
