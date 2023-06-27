//
//  IngredientTag.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 23/06/23.
//

import SwiftUI

struct IngredientTag: View {
    var text: String
    var isSelected: Bool
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap, label: {
            HStack(spacing: 8) {
                Image(systemName: "circle.fill")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.gray)
                
                Text(text.capitalized)
                
                Image(systemName: isSelected ? "xmark" : "plus")
            }
            .padding(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 1)
            )
        })
    }
}

struct IngredientTag_Previews: PreviewProvider {
    static var previews: some View {
        IngredientTag(text: "roti", isSelected: false, onTap: {})
    }
}
