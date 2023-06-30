//
//  RecipeCardList.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi on 25/06/23.
//

import SwiftUI

struct RecipeCardList: View {
    let recipe: RecipeThumbnailResponse
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(recipe.nama_resep)
                    .font(CustomFont.body)
                    .fontWeight(.bold)
                    .foregroundColor(Colors.AAA)
                    .frame(maxWidth: 234, alignment: .leading)
                    .multilineTextAlignment(.leading)
                
                HStack(spacing: 8) {
                    ForEach(recipe.resep_personalisasis) { tag in
                        RecipeTag(text: tag.personalisasi.nama_personalisasi)
                    }
                }
            }
            
            Spacer()
            
            
            //MARK: Recipe Image
            if let url = URL(string: recipe.image) {
               AsyncImage(url: url) { image in
                   image
                       .resizable()
                       .aspectRatio(contentMode: .fill)
                       .frame(width: 123, height: 123)
                       .cornerRadius(8)
                       .clipped()
               } placeholder: {
                   // Placeholder view while the image is loading
                   ProgressView()
                       .frame(width: 123, height: 123)
               }
           } else {
               // View to display when the URL is invalid or nil
                ProgressView()
                   .frame(width: 123, height: 123)
           }
        }
        .padding(12)
    }
}


//struct RecipeCardList_Previews: PreviewProvider {
//    static var previews: some View {
//        RecipeCardList()
//    }
//}
