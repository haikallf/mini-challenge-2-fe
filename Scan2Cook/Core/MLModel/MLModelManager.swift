//
//  MLModelManager.swift
//  Scan2Cook
//
//  Created by Kevin Dallian on 22/06/23.
//

import CoreML
import Foundation

class MLModelManager {
    func output(){
        do{
            let config = MLModelConfiguration()
            let model = try Scan2CookMLModel(configuration: config)
            
        }catch{
            print("Error initializing model : \(error.localizedDescription)")
        }
    }
    
}
