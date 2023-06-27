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
    
    @State private var shouldNavigate: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                //MARK: Heading
                HStack {
                    VStack( alignment: .leading, spacing: 2) {
                        Text("Halo, \(viewModel.username)")
                            .font(.subheadline)
                        
                        Text("Selamat Siang")
                            .font(.title2)
                            .fontWeight(.bold)
                    }
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
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .background(.black)
                        .clipShape(Capsule())
                    })
                    
                }
                .padding(.vertical, 12)
                .padding(.horizontal)
                
                //MARK: Recipe Sections
                ForEach(viewModel.sectionedRecipes, id: \.id) { section in
                    VStack(alignment: .leading, spacing: 14) {
                        HStack {
                            Text(section.name)
                                .font(.title3)
                                .fontWeight(.bold)
                            
                            Spacer()
                            
                            NavigationLink(destination: RecipeListView(title: section.name, description: section.description, recipes: section.recipes), label: {
                                Text("Lihat Semua →")
                                    .font(.footnote)
                                    .fontWeight(.semibold)
                            })
                        }
                        .padding(.horizontal, 16)
                        
                        HorizontalScrollViewMenu(recipes: section.recipes, isSmall: false)
                        .padding(.leading, 16)
                    }
                    .padding(.vertical, 14)
                }
                
                Spacer()
            }
            .padding(.bottom, 32)
        }
        .frame(maxWidth: .infinity)
        .navigationBarBackButtonHidden(true)
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
