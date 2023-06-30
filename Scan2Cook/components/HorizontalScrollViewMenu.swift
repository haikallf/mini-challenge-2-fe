//
//  HorizontalScrollViewMenu.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 23/06/23.
//

import SwiftUI

struct HorizontalScrollViewMenu: View {
    let recipes: [RecipeResponse]
    let isSmall: Bool
    
    @State var shouldNavigate: Bool = false
    @State var selectedId: String = ""
    
    init(recipes: [RecipeResponse], isSmall: Bool = true) {
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
                        
                        Text(recipe.nama_resep)
                            .font(isSmall ? .subheadline : CustomFont.body)
                            .foregroundColor(Colors.AAA)
                            .padding(.vertical, 8)
                            .padding(.leading, 4)
                            .multilineTextAlignment(.leading)
                        
                        Spacer()
                    }
                    .frame(width: isSmall ? 180 : 240)
                    .onTapGesture {
                        selectedId = String(recipe.id)
                        shouldNavigate = true
                    }
                }
            }
            //MARK: Navigate to RecipeDetailsView triggered by shouldNavigate
            NavigationLink(destination: RecipeDetailsView(recipeId: selectedId), isActive: $shouldNavigate) {
                EmptyView()
            }
            .opacity(0)
        }
    }
}

struct HorizontalScrollViewMenu_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalScrollViewMenu(recipes: [])
    }
}
