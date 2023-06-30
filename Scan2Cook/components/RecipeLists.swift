//
//  RecipeLists.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi on 25/06/23.
//

import SwiftUI
import WrapLayout

struct RecipeLists: View {
    var recipes: [RecipeThumbnailResponse]
    var filterOnTap: () -> Void = {}
    @StateObject var personalizationViewModel = PersonalizationViewModel()
    @StateObject var filterViewModel = FilterViewModel()
    @EnvironmentObject var globalStates: GlobalStates
    @State var selectedViewMode = "list"
    @State var isFilterSheetShown = false
    
    @State var personalizationsTemp: [String] = []
    @State var cookingWareTemp: [String] = []
    @State var cookingTimeTemp: [String] = []
    @State var ingredientsCountTemp: [String] = []
    
    var body: some View {
        VStack {
            //MARK: Filter Section
            HStack(spacing: 14) {
                Button(action: {
                    isFilterSheetShown = true
                }, label: {
                    
                    var filterCount = personalizationViewModel.personalizations.count
                    + filterViewModel.cookingWare.count
                    + filterViewModel.cookingTime.count
                    + filterViewModel.ingredientsCount.count
                    
                    if (filterCount > 0) {
                        HStack(spacing: 4) {
                            Image(systemName: "line.3.horizontal.decrease")
                            
                            Text("\(filterCount) Filter")
                            
                            Image(systemName: "xmark")
                                .padding(.leading, 8)
                        }
                        .font(CustomFont.footnote)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 12)
                        .foregroundColor(.white)
                        .background(Colors.primary)
                        .cornerRadius(120)
                        
                    } else {
                        HStack(spacing: 4) {
                            Image(systemName: "line.3.horizontal.decrease")
                            
                            Text("Filter")
                        }
                        .font(CustomFont.footnote)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 12)
                        .foregroundColor(Colors.onSecondaryContainer)
                        .background(Colors.secondaryContainer)
                        .cornerRadius(120)
                    }
                    
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
                        .foregroundColor(selectedViewMode == "list" ? Colors.onSecondaryContainer : Colors.disabled)
                        .background(selectedViewMode == "list" ? Colors.secondaryContainer : .white.opacity(0))
                        .clipShape(Circle())
                })
                
                Button(action: {
                    selectedViewMode = "icons"
                }, label: {
                    Image(systemName: "square.grid.2x2")
                        .font(.callout)
                        .fontWeight(.semibold)
                        .padding(6)
                        .foregroundColor(selectedViewMode == "icons" ? Colors.onSecondaryContainer : Colors.disabled)
                        .background(selectedViewMode == "icons" ? Colors.secondaryContainer : .white.opacity(0))
                        .clipShape(Circle())
                })
                
            }
            .padding(.vertical, 12)
            .padding(.horizontal)
            
            
            //MARK: Recipe Card Section
            ScrollView {
                ForEach(recipes, id:\.id) { recipe in
                    NavigationLink(destination: RecipeDetailsView(recipeId: String(recipe.id)), label: {
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
                    //MARK: Heading Section
                    HStack {
                        Text("Filter")
                            .font(CustomFont.title6)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Button(action: {
                            personalizationViewModel.personalizations = personalizationsTemp
                            filterViewModel.cookingWare = cookingWareTemp
                            filterViewModel.cookingTime = cookingTimeTemp
                            filterViewModel.ingredientsCount = ingredientsCountTemp
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
                    .padding(.vertical, 14.5)
                    
                    //MARK: Cooking Ware Section
                    VStack(alignment: .leading) {
                        Text("Alat Masak")
                            .font(CustomFont.subheadline)
                            .fontWeight(.semibold)
                        
                        HStack {
                            FilterTag(text: "<2 alat", isSelected: filterViewModel.cookingWare.contains("left"), onTap: {
                                filterViewModel.updateCookingWare(value: "left")
                            })
                            
                            FilterTag(text: "3-5 alat", isSelected: filterViewModel.cookingWare.contains("middle"), onTap: {
                                filterViewModel.updateCookingWare(value: "middle")
                            })
                            
                            FilterTag(text: ">5 alat", isSelected: filterViewModel.cookingWare.contains("right"), onTap: {
                                filterViewModel.updateCookingWare(value: "right")
                            })
                            
                            Spacer()
                        }
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal)
                    
                    //MARK: Cooking Time Section
                    VStack(alignment: .leading) {
                        Text("Waktu Pembuatan")
                            .font(CustomFont.subheadline)
                            .fontWeight(.semibold)
                        
                        HStack {
                            FilterTag(text: "<10 menit", isSelected: filterViewModel.cookingTime.contains("left"), onTap: {
                                filterViewModel.updateCookingTime(value: "left")
                            })
                            
                            FilterTag(text: "10-20 menit", isSelected: filterViewModel.cookingTime.contains("middle"), onTap: {
                                filterViewModel.updateCookingTime(value: "middle")
                            })
                            
                            FilterTag(text: ">20 menit", isSelected: filterViewModel.cookingTime.contains("right"), onTap: {
                                filterViewModel.updateCookingTime(value: "right")
                            })
                            
                            Spacer()
                        }
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal)
                    
                    //MARK: Ingredients Count Section
                    VStack(alignment: .leading) {
                        Text("Jumlah Bahan")
                            .font(CustomFont.subheadline)
                            .fontWeight(.semibold)
                        
                        HStack {
                            FilterTag(text: "<2 bahan", isSelected: filterViewModel.ingredientsCount.contains("left"), onTap: {
                                filterViewModel.updateIngredientsCount(value: "left")
                            })
                            
                            FilterTag(text: "2-5 bahan", isSelected: filterViewModel.ingredientsCount.contains("middle"), onTap: {
                                filterViewModel.updateIngredientsCount(value: "middle")
                            })
                            
                            FilterTag(text: ">5 bahan", isSelected: filterViewModel.ingredientsCount.contains("right"), onTap: {
                                filterViewModel.updateIngredientsCount(value: "right")
                            })
                            
                            Spacer()
                        }
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal)
                    
                    //MARK: Personalization Section
                    VStack(alignment: .leading, spacing: 14) {
                        Text("Aku ga bisa makan...")
                            .font(CustomFont.subheadline)
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
                    .padding(.vertical, 12)
                    .padding(.horizontal)
                    
                    Spacer()
                    
                    CupertinoButton("Simpan", action: {
                        globalStates.updateFilters(personalizationFilter: personalizationViewModel.personalizations, cookingWareFilter: filterViewModel.cookingWare, cookingTimeFilter: filterViewModel.cookingTime, ingredientsCountFilter: filterViewModel.ingredientsCount)
                        
                        personalizationsTemp = personalizationViewModel.personalizations
                        cookingWareTemp = filterViewModel.cookingWare
                        cookingTimeTemp = filterViewModel.cookingWare
                        ingredientsCountTemp = filterViewModel.ingredientsCount
                        isFilterSheetShown = false
                    }, isDisabled: false, foregroundColor: Colors.onSecondaryContainer, backgroundColor: Colors.secondaryContainer)
                        .padding(.horizontal)
                }
                .background(Colors.card5)
                .foregroundColor(.black)
            })
            
            Spacer()
        }
        .onAppear {
            personalizationsTemp = personalizationViewModel.personalizations
            cookingWareTemp = filterViewModel.cookingWare
            cookingTimeTemp = filterViewModel.cookingTime
            ingredientsCountTemp = filterViewModel.ingredientsCount
        }
    }
}

struct RecipeLists_Previews: PreviewProvider {
    static var previews: some View {
        RecipeLists(recipes: [])
    }
}
