//
//  BookmarkView.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 23/06/23.
//

import SwiftUI

struct BookmarkView: View {
    @ObservedObject var viewModel: BookmarkViewModel = BookmarkViewModel()
    @StateObject var globalStates: GlobalStates = GlobalStates()
    
    var body: some View {
        VStack {
            //MARK: SearchBar
            CustomSearchBar(placeholder: "Cari Resep...", searchText: $viewModel.searchText)
                .padding(.horizontal)
            
            //MARK: Heading
            VStack(alignment: .leading) {
                HStack {
                    Text("Resep Disimpan")
                        .font(CustomFont.title3)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                HStack {
                    Text("\(viewModel.bookmarkedRecipes.count) resep disimpan")
                    Spacer()
                }
            }
            .foregroundColor(Colors.AAA)
            .padding(.horizontal)
            
            //MARK: Recipes List
            RecipeLists(recipes: viewModel.filteredRecipes)
                .environmentObject(globalStates)
        }
        .onReceive(viewModel.$searchText) { _ in
            viewModel.filterRecipe()
        }
        .onReceive(globalStates.$cookingWareFilter, perform: { _ in
            Task {
                await viewModel.getRecipeByIds(personalizations: globalStates.personalizationsFilter, cookingWare: globalStates.cookingWareFilter, cookingTime: globalStates.cookingTimeFilter, ingredientsCount: globalStates.ingredientsCountFilter)
            }
        })
        .onReceive(globalStates.$cookingTimeFilter, perform: { _ in
            Task {
                await viewModel.getRecipeByIds(personalizations: globalStates.personalizationsFilter, cookingWare: globalStates.cookingWareFilter, cookingTime: globalStates.cookingTimeFilter, ingredientsCount: globalStates.ingredientsCountFilter)
            }
        })
        .onReceive(globalStates.$ingredientsCountFilter, perform: { _ in
            Task {
                await viewModel.getRecipeByIds(personalizations: globalStates.personalizationsFilter, cookingWare: globalStates.cookingWareFilter, cookingTime: globalStates.cookingTimeFilter, ingredientsCount: globalStates.ingredientsCountFilter)
            }
        })
        .onReceive(globalStates.$personalizationsFilter, perform: { _ in
            Task {
                await viewModel.getRecipeByIds(personalizations: globalStates.personalizationsFilter, cookingWare: globalStates.cookingWareFilter, cookingTime: globalStates.cookingTimeFilter, ingredientsCount: globalStates.ingredientsCountFilter)
            }
            
        })
        .navigationBarBackButtonHidden(true)
    }
}

struct BookmarkView_Previews: PreviewProvider {
    static var previews: some View {
        BookmarkView()
    }
}
