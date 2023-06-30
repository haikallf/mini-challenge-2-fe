//
//  RecipeCard.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 23/06/23.
//

import SwiftUI

struct RecipeCard: View {
    let recipe: RecipeThumbnailResponse
    var body: some View {
        VStack(alignment: .leading) {
            
            //MARK: Recipe Image
            if let url = URL(string: recipe.image) {
               AsyncImage(url: url) { image in
                   image
                       .resizable()
                       .aspectRatio(contentMode: .fill)
                       .frame(width: 369, height: 123)
                       .cornerRadius(8)
                       .clipped()
               } placeholder: {
                   // Placeholder view while the image is loading
                   ProgressView()
                       .frame(width: 369, height: 123)
               }
           } else {
               // View to display when the URL is invalid or nil
                ProgressView()
                   .frame(width: 369, height: 123)
           }
            
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
