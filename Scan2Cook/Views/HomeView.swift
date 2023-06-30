//
//  HomeView.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 21/06/23.
//

import SwiftUI
import WrapLayout

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()
    @State var isPersonalizationSheetShown: Bool = false
    
    @StateObject var personalizationViewModel = PersonalizationViewModel()
    @StateObject var globalStates: GlobalStates = GlobalStates()
    
    @State private var shouldNavigate: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                //MARK: Heading
                VStack( alignment: .leading, spacing: 2) {
                    Text("Halo, ")
                        .font(CustomFont.callout)
                        .foregroundColor(Colors.disabled)
                    
                    HStack {
                        Text(viewModel.username)
                            .font(CustomFont.title2)
                            .foregroundColor(Colors.AAA)
                            .multilineTextAlignment(.leading)
                            .lineLimit(2)
                        
                        Spacer()
                        
                        Button(action: {
                            isPersonalizationSheetShown = true
                        }, label: {
                            HStack {
                                Text("Personalisasi")
                                
                                Image(systemName: "chevron.down")
                            }
                            .padding(.vertical, 6)
                            .padding(.horizontal, 10)
                            .font(CustomFont.footnote)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .background(Colors.secondary)
                            .clipShape(Capsule())
                        })
                        
                    }
                }
                .padding(.vertical, 12)
                .padding(.horizontal)
                
                //MARK: Today's Recipe Sections
                VStack(alignment: .leading, spacing: 14) {
                    HStack {
                        Text("Resep Hari Ini")
                            .font(CustomFont.title6)
                            .fontWeight(.bold)
                            .foregroundColor(Colors.AAA)
                        
                        Spacer()
                        
                        NavigationLink(destination: RecipeListView(title: "Resep Hari Ini", description: "Ada resep pilihan dari kami untuk kamu untuk hari ini nih!", recipes: viewModel.todaysRecipe).environmentObject(globalStates), label: {
                            Text("Lihat Semua →")
                                .font(CustomFont.footnote)
                                .fontWeight(.semibold)
                                .foregroundColor(Colors.secondary)
                        })
                    }
                    .padding(.horizontal, 16)
                    
                    HorizontalScrollViewMenu(recipes: viewModel.todaysRecipe, isSmall: false)
                    .padding(.leading, 16)
                }
                .padding(.vertical, 14)
                
                //MARK: Newest Recipe Sections
                VStack(alignment: .leading, spacing: 14) {
                    HStack {
                        Text("Resep Terbaru")
                            .font(CustomFont.title6)
                            .fontWeight(.bold)
                            .foregroundColor(Colors.AAA)
                        
                        Spacer()
                        
                        NavigationLink(destination: RecipeListView(title: "Resep Terbaru", description: "Ada resep yang baru ditambahkan nih!", recipes: viewModel.newestRecipes).environmentObject(globalStates), label: {
                            Text("Lihat Semua →")
                                .font(CustomFont.footnote)
                                .fontWeight(.semibold)
                                .foregroundColor(Colors.secondary)
                        })
                    }
                    .padding(.horizontal, 16)
                    
                    HorizontalScrollViewMenu(recipes: viewModel.newestRecipes, isSmall: false)
                    .padding(.leading, 16)
                }
                .padding(.vertical, 14)
                
                Spacer()
            }
            .padding(.bottom, 32)
        }
        .frame(maxWidth: .infinity)
        .navigationBarBackButtonHidden(true)
        .onReceive(globalStates.$cookingWareFilter, perform: { _ in
            Task {
                await viewModel.getTodaysRecipes(personalizations: globalStates.personalizationsFilter, cookingWare: globalStates.cookingWareFilter, cookingTime: globalStates.cookingTimeFilter, ingredientsCount: globalStates.ingredientsCountFilter)
                
                await viewModel.getNewestRecipes(personalizations: globalStates.personalizationsFilter, cookingWare: globalStates.cookingWareFilter, cookingTime: globalStates.cookingTimeFilter, ingredientsCount: globalStates.ingredientsCountFilter)
            }
        })
        .onReceive(globalStates.$cookingTimeFilter, perform: { _ in
            Task {
                await viewModel.getTodaysRecipes(personalizations: globalStates.personalizationsFilter, cookingWare: globalStates.cookingWareFilter, cookingTime: globalStates.cookingTimeFilter, ingredientsCount: globalStates.ingredientsCountFilter)
                
                await viewModel.getNewestRecipes(personalizations: globalStates.personalizationsFilter, cookingWare: globalStates.cookingWareFilter, cookingTime: globalStates.cookingTimeFilter, ingredientsCount: globalStates.ingredientsCountFilter)
            }
        })
        .onReceive(globalStates.$ingredientsCountFilter, perform: { _ in
            Task {
                await viewModel.getTodaysRecipes(personalizations: globalStates.personalizationsFilter, cookingWare: globalStates.cookingWareFilter, cookingTime: globalStates.cookingTimeFilter, ingredientsCount: globalStates.ingredientsCountFilter)
                
                await viewModel.getNewestRecipes(personalizations: globalStates.personalizationsFilter, cookingWare: globalStates.cookingWareFilter, cookingTime: globalStates.cookingTimeFilter, ingredientsCount: globalStates.ingredientsCountFilter)
            }
        })
        .onReceive(globalStates.$personalizationsFilter, perform: { _ in
            Task {
                await viewModel.getTodaysRecipes(personalizations: globalStates.personalizationsFilter, cookingWare: globalStates.cookingWareFilter, cookingTime: globalStates.cookingTimeFilter, ingredientsCount: globalStates.ingredientsCountFilter)
                
                await viewModel.getNewestRecipes(personalizations: globalStates.personalizationsFilter, cookingWare: globalStates.cookingWareFilter, cookingTime: globalStates.cookingTimeFilter, ingredientsCount: globalStates.ingredientsCountFilter)
            }
        })
        .sheet(isPresented: $isPersonalizationSheetShown, content: {
            VStack {
                VStack(alignment: .leading) {
                    //MARK: Heading Section
                    VStack(alignment: .leading, spacing: 6) {
                        //MARK: Page Heading
                        Text("Personalisasi Akun")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                        
                        //MARK: Page Subheading
                        Text("Cupcake ipsum dolor sit amet cookie. Oat cake apple pie sweet dessert jujubes brownie.")
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                    }
                    .padding(.bottom, 12)
                    .padding(.top, 24)
                    
                    //MARK: Personalization Section
                    VStack(alignment: .leading, spacing: 14) {
                        Text("Aku ga bisa makan...")
                            .font(.title3)
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
                    .padding(.vertical, 12)
                    
                    Spacer()
                    
                    CupertinoButton("Simpan", action: {
                        personalizationViewModel.setPersonalizations()
                        isPersonalizationSheetShown = false
                    })
                }
                .padding(.horizontal)
                .navigationBarBackButtonHidden(true)
                .onAppear {
                    print(personalizationViewModel.personalizations)
                }
            }
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
