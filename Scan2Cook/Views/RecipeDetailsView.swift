//
//  RecipeDetailsView.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 23/06/23.
//

import SwiftUI

struct RecipeDetailsView: View {
    let recipeId: String
    
    var body: some View {
        Text(recipeId)
    }
}

struct RecipeDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailsView(recipeId: "1")
    }
}
