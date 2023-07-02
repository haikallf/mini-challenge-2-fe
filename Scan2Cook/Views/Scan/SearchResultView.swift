//
//  SearchResultView.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi on 26/06/23.
//

import SwiftUI

struct SearchResultView: View {
    @StateObject var searchResultViewModel = SearchResultViewModel()
    @State var ingredients : [Ingredient]
    @State var recipes: [RecipeThumbnailResponse] = []
    @State var navigateToHome = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            Colors.background
                .ignoresSafeArea()
            
            VStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("\(searchResultViewModel.recipeResults.count) Resep Ditemuin")
                        .font(CustomFont.title6)
                        .bold()
                    
                    Text("Ada aja deh yang cocok sama bahan yang kamu punya")
                        .font(.footnote)
                }
                .foregroundColor(Colors.AAA)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 12)
                .padding(.horizontal)
                
                RecipeLists(recipes: searchResultViewModel.recipeResults)
                    .environmentObject(GlobalStates())
                NavigationLink("", destination: MainView(), isActive: $navigateToHome)
            }
            .navigationBarBackButtonHidden(true)
            .task {
                searchResultViewModel.convertIngredient(ingredients: ingredients)
                await searchResultViewModel.getRecipeResults()
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    BackButton()
                        .offset(x: -15, y: -5)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        navigateToHome = true
                    }, label: {
                        Text("Done")
                            .font(CustomFont.body)
                            .foregroundColor(Colors.primary)
                    })
                
                }
            }
        }
        
        
    }
}

struct SearchResultView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultView(ingredients: Ingredient.all)
    }
}
