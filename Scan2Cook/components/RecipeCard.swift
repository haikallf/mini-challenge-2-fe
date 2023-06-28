//
//  RecipeCard.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 23/06/23.
//

import SwiftUI

struct RecipeCard: View {
    let recipe: Recipe
    var body: some View {
        VStack(alignment: .leading) {
            Rectangle()
                .fill(.gray)
                .frame(width: 369, height: 123)
                .cornerRadius(8)
            
            Text(recipe.name)
                .font(CustomFont.body)
                .fontWeight(.bold)
                .foregroundColor(Colors.AAA)
                .multilineTextAlignment(.leading)
            
            HStack(spacing: 8) {
                ForEach(recipe.tags, id: \.self) { tag in
                    RecipeTag(text: tag)
                }
            }
        }
        .padding(12)
    }
}

//struct RecipeCard_Previews: PreviewProvider {
//    static var previews: some View {
//        RecipeCard()
//    }
//}
