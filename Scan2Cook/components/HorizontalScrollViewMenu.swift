//
//  HorizontalScrollViewMenu.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 23/06/23.
//

import SwiftUI

struct HorizontalScrollViewMenu: View {
    let recipes: [RecipeThumbnailResponse]
    let isSmall: Bool
    
    @State var shouldNavigate: Bool = false
    @State var selectedId: String = ""
    
    init(recipes: [RecipeThumbnailResponse], isSmall: Bool = true) {
        self.recipes = recipes
        self.isSmall = isSmall
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 14) {
                ForEach(recipes) { recipe in
                    VStack(alignment: .leading) {
                        //MARK: Recipe Image
                        if let url = URL(string: recipe.image) {
                           AsyncImage(url: url) { image in
                               image
                                   .resizable()
                                   .aspectRatio(contentMode: .fill)
                                   .frame(width: isSmall ? 180 : 240, height: isSmall ? 180 : 300)
                                   .cornerRadius(8)
                                   .clipped()
                           } placeholder: {
                               // Placeholder view while the image is loading
                               ProgressView()
                                   .frame(width: isSmall ? 180 : 240, height: isSmall ? 180 : 300)
                           }
                       } else {
                           // View to display when the URL is invalid or nil
                           VStack {
                               ProgressView()
                           }
                           .frame(width: isSmall ? 180 : 240, height: isSmall ? 180 : 300)
                       }
                        
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
