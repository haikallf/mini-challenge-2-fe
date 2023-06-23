//
//  BookmarkView.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 23/06/23.
//

import SwiftUI

struct BookmarkView: View {
    @ObservedObject var viewModel: BookmarkViewModel = BookmarkViewModel()
    @State var searchValue: String = ""
    
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
            
            ScrollView {
                ForEach(viewModel.filteredMeals, id:\.id) { recipe in
                    RecipeCard(recipe: recipe)
                }
            }
//            .searchable(text: $viewModel.searchText)
            
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
