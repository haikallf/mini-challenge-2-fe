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
    var backgroundColor: Color = .white.opacity(0)
    
    var body: some View {
        Button(action: onTap, label: {
            HStack(spacing: 8) {
                Text(text.capitalized)
                    .font(CustomFont.footnote)
                    .padding(.top, 3)
                
                Image(systemName: isSelected ? "xmark" : "plus")
                    .font(.footnote)
            }
            .padding(8)
            .background(backgroundColor)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(backgroundColor != .white.opacity(0) ? backgroundColor : Colors.border1, lineWidth: 1)
            )
        })
    }
}

struct IngredientTag_Previews: PreviewProvider {
    static var previews: some View {
        IngredientTag(text: "roti", isSelected: false, onTap: {}, backgroundColor: .blue.opacity(0.2))
    }
}

