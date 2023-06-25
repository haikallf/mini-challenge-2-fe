//
//  RecipeCardList.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi on 25/06/23.
//

import SwiftUI

struct RecipeCardList: View {
    let recipe: Recipe
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(recipe.name)
                    .fontWeight(.semibold)
                    .frame(maxWidth: 234, alignment: .leading)
                
                HStack(spacing: 8) {
                    ForEach(recipe.tags, id: \.self) { tag in
                        RecipeTag(text: tag)
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
