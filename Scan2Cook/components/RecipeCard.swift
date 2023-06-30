//
//  RecipeCard.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 23/06/23.
//

import SwiftUI

struct RecipeCard: View {
    let recipe: RecipeResponse
    var body: some View {
        VStack(alignment: .leading) {
            Rectangle()
                .fill(.gray)
                .frame(width: 369, height: 123)
                .cornerRadius(8)
            
            Text(recipe.nama_resep)
                .font(CustomFont.body)
                .fontWeight(.bold)
                .foregroundColor(Colors.AAA)
                .multilineTextAlignment(.leading)
            
            HStack(spacing: 8) {
                ForEach(recipe.resep_personalisasis) { tag in
                    RecipeTag(text: tag.personalisasi.nama_personalisasi)
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
