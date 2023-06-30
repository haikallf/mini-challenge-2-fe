//
//  RecipeCardList.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi on 25/06/23.
//

import SwiftUI

struct RecipeCardList: View {
    let recipe: RecipeResponse
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
            
            Rectangle()
                .fill(.gray)
                .frame(width: 123, height: 123)
                .cornerRadius(8)
        }
        .padding(12)
    }
}


//struct RecipeCardList_Previews: PreviewProvider {
//    static var previews: some View {
//        RecipeCardList()
//    }
//}
