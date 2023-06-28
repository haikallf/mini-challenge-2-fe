//
//  RecipeTag.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 23/06/23.
//

import SwiftUI

struct RecipeTag: View {
    let text: String
    
    var body: some View {
        Text(text.capitalized)
            .font(CustomFont.caption2)
            .padding(.vertical, 4)
            .padding(.horizontal, 8)
            .foregroundColor(Colors.onPrimaryContainer)
            .background(Colors.primaryContainer)
            .cornerRadius(120)
    }
}

struct RecipeTag_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTag(text: "manis")
    }
}
