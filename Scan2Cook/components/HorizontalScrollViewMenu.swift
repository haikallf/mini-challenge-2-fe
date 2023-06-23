//
//  HorizontalScrollViewMenu.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 23/06/23.
//

import SwiftUI

struct HorizontalScrollViewMenu: View {
    let recipes: [Recipe]
    let isSmall: Bool
    
    init(recipes:[Recipe], isSmall: Bool = true) {
        self.recipes = recipes
        self.isSmall = isSmall
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 14) {
                ForEach(recipes) { recipe in
                    VStack(alignment: .leading) {
                        Rectangle()
                            .fill(.gray)
                            .frame(width: isSmall ? 180 : 240, height: isSmall ? 180 : 300)
                            .cornerRadius(8)
                        
                        Text(recipe.name)
                            .font(isSmall ? .subheadline : .headline)
                            .fontWeight(.semibold)
                            .padding(.vertical, 8)
                            .padding(.leading, 4)
                    }
                }
            }
        }
    }
}

struct HorizontalScrollViewMenu_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalScrollViewMenu(recipes: Recipe.all)
    }
}
