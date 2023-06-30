//
//  RecipeListView.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi on 26/06/23.
//

import SwiftUI

struct RecipeListView: View {
    let title: String
    let description: String?
    var recipes: [RecipeResponse]
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            Colors.background
                .ignoresSafeArea()
            
            VStack {
                BackButton()
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(CustomFont.title4)
                        .foregroundColor(Colors.AAA)
                        
                    if (description != nil || description == "") {
                        Text(description!)
                            .font(.footnote)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 12)
                .padding(.horizontal)
                
                RecipeLists(recipes: recipes)
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView(title: "Title", description: "Subtitle", recipes: [])
    }
}
