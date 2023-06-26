//
//  RecipeLists.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi on 25/06/23.
//

import SwiftUI
import WrapLayout

struct RecipeLists: View {
    var recipes: [Recipe]
    @StateObject var personalizationViewModel = PersonalizationViewModel()
    @StateObject var filterViewModel = FilterViewModel()
    @State var selectedViewMode = "list"
    @State var isFilterSheetShown = false
    
    var body: some View {
        VStack {
            //MARK: Filter Section
            HStack(spacing: 14) {
                Button(action: {
                    isFilterSheetShown = true
                }, label: {
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
                    NavigationLink(destination: RecipeDetailsView(recipeId: recipe.id), label: {
                        if (selectedViewMode == "list") {
                            RecipeCardList(recipe: recipe)
                        } else if (selectedViewMode == "icons") {
                            RecipeCard(recipe: recipe)
                        }
                    })
                }
            }
            .sheet(isPresented: $isFilterSheetShown, content: {
                VStack {
                    //MARK: Drag Indicator
                    RoundedRectangle(cornerRadius: 3)
                        .fill(.gray)
                        .frame(width: 36, height: 5)
                        .padding(.top, 6)
                        .padding(.bottom, 3)
                    
                    //MARK: Heading Section
                    HStack {
                        Text("Filter")
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Button(action: {
                            isFilterSheetShown = false
                        }, label: {
                            Image(systemName: "xmark")
                                .padding(10)
                                .font(.callout)
                                .fontWeight(.semibold)
                                .background(Color("fillsTertiary"))
                                .foregroundColor(.black)
                                .clipShape(Circle())
                        })
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 14.5)
                    
                    //MARK: Cooking Ware Section
                    VStack(alignment: .leading) {
                        Text("Alat Masak")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        HStack {
                            FilterTag(text: "<2 alat", isSelected: filterViewModel.cookingWare.contains("1"), onTap: {
                                filterViewModel.updateCookingWare(value: "1")
                            })
                            
                            FilterTag(text: "3-5 alat", isSelected: filterViewModel.cookingWare.contains("2"), onTap: {
                                filterViewModel.updateCookingWare(value: "2")
                            })
                            
                            FilterTag(text: "<5 alat", isSelected: filterViewModel.cookingWare.contains("3"), onTap: {
                                filterViewModel.updateCookingWare(value: "3")
                            })
                            
                            Spacer()
                        }
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal)
                    
                    //MARK: Cooking Time Section
                    VStack(alignment: .leading) {
                        Text("Waktu Pembuatan")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        HStack {
                            FilterTag(text: "<10 menit", isSelected: filterViewModel.cookingTime.contains("1"), onTap: {
                                filterViewModel.updateCookingTime(value: "1")
                            })
                            
                            FilterTag(text: "10-20 menit", isSelected: filterViewModel.cookingTime.contains("2"), onTap: {
                                filterViewModel.updateCookingTime(value: "2")
                            })
                            
                            FilterTag(text: ">20 menit", isSelected: filterViewModel.cookingTime.contains("3"), onTap: {
                                filterViewModel.updateCookingTime(value: "3")
                            })
                            
                            Spacer()
                        }
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal)
                    
                    //MARK: Ingredients Count Section
                    VStack(alignment: .leading) {
                        Text("Jumlah Bahan")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        HStack {
                            FilterTag(text: "<2 bahan", isSelected: filterViewModel.ingredientsCount.contains("1"), onTap: {
                                filterViewModel.updateIngredientsCount(value: "1")
                            })
                            
                            FilterTag(text: "2-5 bahan", isSelected: filterViewModel.ingredientsCount.contains("2"), onTap: {
                                filterViewModel.updateIngredientsCount(value: "2")
                            })
                            
                            FilterTag(text: ">5 bahan", isSelected: filterViewModel.ingredientsCount.contains("3"), onTap: {
                                filterViewModel.updateIngredientsCount(value: "3")
                            })
                            
                            Spacer()
                        }
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal)
                    
                    //MARK: Personalization Section
                    VStack(alignment: .leading, spacing: 14) {
                        Text("Aku ga bisa makan...")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        WrapLayout(horizontalSpacing: 14, verticalSpacing: 14) {
                            PersonalizationTag("Laktosa", emoji: "🥛", isSelected: personalizationViewModel.personalizations.contains(
                                getPersonalizationType(personalization: PersonalizationType.laktosa)
                            ), action: {
                                personalizationViewModel.updatePersonalizations(
                                    personalization: getPersonalizationType(personalization: PersonalizationType.laktosa)
                                )
                            })
                            
                            PersonalizationTag("Seafood", emoji: "🐟", isSelected: personalizationViewModel.personalizations.contains(
                                getPersonalizationType(personalization: PersonalizationType.seafood)
                            ), action:  {
                                personalizationViewModel.updatePersonalizations(
                                    personalization: getPersonalizationType(personalization: PersonalizationType.seafood)
                                )
                            })
                            
                            PersonalizationTag("Kacang", emoji: "🥜", isSelected: personalizationViewModel.personalizations.contains(
                                getPersonalizationType(personalization: PersonalizationType.kacang)
                            ), action:  {
                                personalizationViewModel.updatePersonalizations(
                                    personalization: getPersonalizationType(personalization: PersonalizationType.kacang)
                                )
                            })
                            
                            PersonalizationTag("Babi", emoji: "🐷", isSelected: personalizationViewModel.personalizations.contains(
                                getPersonalizationType(personalization: PersonalizationType.babi)
                            ), action:  {
                                personalizationViewModel.updatePersonalizations(
                                    personalization: getPersonalizationType(personalization: PersonalizationType.babi)
                                )
                            })
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    
                    Spacer()
                    
                    CupertinoButton("Simpan", action: {}, isDisabled: false)
                        .padding(.horizontal)
                }
            })
            
            Spacer()
        }
    }
}

struct RecipeLists_Previews: PreviewProvider {
    static var previews: some View {
        RecipeLists(recipes: Recipe.all)
    }
}
