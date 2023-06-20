//
//  PersonalizationViewModel.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 21/06/23.
//

import SwiftUI

class PersonalizationViewModel: ObservableObject {
    @Published var personalizations: [String]
    let userDefaults = UserDefaults.standard
    let personalizationsKey = "personalizations"
    
    init() {
        personalizations = userDefaults.stringArray(forKey: personalizationsKey) ?? []
    }
    
    func setPersonalizations() {
        userDefaults.set(self.personalizations, forKey: personalizationsKey)
    }
    
    func updatePersonalizations(personalization: String) {
        if (self.personalizations.contains(personalization)) {
            self.personalizations = self.personalizations.filter { $0 != personalization }
        } else {
            self.personalizations.append(personalization)
        }
    }
    
}
