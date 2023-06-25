//
//  RecipeLists.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi on 25/06/23.
//

import SwiftUI

struct RecipeLists: View {
    @Binding var recipes: [Recipe]
    @State var selectedViewMode = "list"
    @State var isFilterSheetShown = false
    
    var body: some View {
        VStack {
            //MARK: Filter Section
            HStack(spacing: 14) {
                Button(action: {}, label: {
                    HStack(spacing: 4) {
                        Image(systemName: "line.3.horizontal.decrease")
                        
                        Text("Filter")
                    }
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 120)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                })
                
                Spacer()
                
                //MARK: View Buttons
                Button(action: {
                    selectedViewMode = "list"
                }, label: {
                    Image(systemName: "list.bullet")
                        .font(.callout)
                        .fontWeight(.semibold)
                        .padding(6)
                        .background(selectedViewMode == "list" ? Color("fillsPrimary") : .white)
                        .clipShape(Circle())
                })
                
                Button(action: {
                    selectedViewMode = "icons"
                }, label: {
                    Image(systemName: "square.grid.2x2")
                        .font(.callout)
                        .fontWeight(.semibold)
                        .padding(6)
                        .background(selectedViewMode == "icons" ? Color("fillsPrimary") : .white)
                        .clipShape(Circle())
                })
                
            }
            .padding(.vertical, 12)
            .padding(.horizontal)
            
            //MARK: Recipe Card Section
            ScrollView {
                ForEach(recipes, id:\.id) { recipe in
                    if (selectedViewMode == "list") {
                        RecipeCardList(recipe: recipe)
                    } else if (selectedViewMode == "icons") {
                        RecipeCard(recipe: recipe)
                    }
                }
            }
            
            Spacer()
        }
    }
}

//struct RecipeLists_Previews: PreviewProvider {
//    static var previews: some View {
//        RecipeLists()
//    }
//}
