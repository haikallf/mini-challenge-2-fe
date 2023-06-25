//
//  BookmarkView.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 23/06/23.
//

import SwiftUI

struct BookmarkView: View {
    @ObservedObject var viewModel: BookmarkViewModel = BookmarkViewModel()
    
    @State var selectedViewMode = "list"
    let viewOptions: [String] = ["list", "icons"]
    
    var body: some View {
        VStack {
            //MARK: SearchBar
            CustomSearchBar(placeholder: "Cari Resep...", searchText: $viewModel.searchText)
                .padding(.horizontal)
            
            //MARK: Heading
            VStack(alignment: .leading) {
                HStack {
                    Text("Resep Disimpan")
                        .font(.title)
                    .fontWeight(.bold)
                    
                    Spacer()
                }
                HStack {
                    Text("\(viewModel.bookmarkedRecipes.count) resep disimpan")
                    Spacer()
                }
            }
            .padding(.horizontal)
            
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
                ForEach(viewModel.filteredMeals, id:\.id) { recipe in
                    if (selectedViewMode == "list") {
                        RecipeCardList(recipe: recipe)
                    } else if (selectedViewMode == "icons") {
                        RecipeCard(recipe: recipe)
                    }
                }
            }
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct BookmarkView_Previews: PreviewProvider {
    static var previews: some View {
        BookmarkView()
    }
}
