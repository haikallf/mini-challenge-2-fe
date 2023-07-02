//
//  ScanResultView.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 23/06/23.
//

import SwiftUI
import WrapLayout

struct ScanResultView: View {
    @EnvironmentObject var scanViewModel: ScanViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var shouldNavigate: Bool = false
    @State var isAddIngredientsSheetShown: Bool = false
    @State var selectedIngredientsTemp: [Ingredient] = []
    
    var body: some View {
    //MARK: Image Preview
       ZStack{
           Image(uiImage: scanViewModel.image)
               .resizable()
               .scaledToFill()
           BackButton(isCircleButton: true)
               .offset(y: -100)
        
       }.frame(height: 220)

        
        //MARK: Ingredients Detail Section
        ZStack {
            Colors.background
                .ignoresSafeArea()
            
            VStack {
                //MARK: Heading
                VStack(alignment: .leading, spacing: 4) {
                    Text("\(scanViewModel.selectedIngredients.count) Bahan ditemukan")
                        .font(CustomFont.title6)
                        .fontWeight(.bold)
                    
                    
                    Text("Cek dulu barang yang kamu scan udah bener atau belum~")
                        .font(CustomFont.footnote)
                }
                .foregroundColor(Colors.AAA)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 12)
                .padding(.horizontal)
                
                //MARK: Selected Ingredients
                WrapLayout(horizontalSpacing: 10, verticalSpacing: 14) {
                    ForEach(scanViewModel.selectedIngredients, id: \.self) { ingredient in
                        IngredientTag(text: ingredient.name, isSelected: true, onTap: {
                            scanViewModel.updateSelectedIngredients(ingredient: ingredient)
                        }, backgroundColor: .orange.opacity(0.2))
                    }
                    IngredientTag(text: "Tambah Bahan", isSelected: false, onTap: {
                        isAddIngredientsSheetShown = true
                    }, backgroundColor: Colors.tertiaryContainer)
                    HStack {
                        Spacer()
                    }
                }
                .padding(.horizontal, 20)
                Spacer()
            }.background(in: Rectangle())
        }
        
        
        
        //MARK: Search Button
        CupertinoButton("Lanjut", action: {
            shouldNavigate = true
        },  foregroundColor: Colors.onSecondaryContainer,
            backgroundColor: Colors.secondaryContainer)
            .padding(.horizontal)
        
        //MARK: Navigate to SearchResult triggered by shouldNavigate
        NavigationLink(destination: SearchResultView(ingredients: selectedIngredientsTemp), isActive: $shouldNavigate) {
            EmptyView()
        }
        .opacity(0)
    
    .navigationBarBackButtonHidden()
    .onAppear {
        selectedIngredientsTemp = scanViewModel.selectedIngredients
    }
    .sheet(isPresented: $isAddIngredientsSheetShown, content: {
        NavigationView {
            ZStack {
                Color.white
                    .ignoresSafeArea()
                
                VStack {
                    //MARK: SearchBar
                    CustomSearchBar(placeholder: "Cari Bahan...", searchText: $scanViewModel.searchText)
                        .padding(.horizontal)
                    
                    Divider()
                        .padding(.bottom)
                    
                    //MARK: Available Ingredients
                    ScrollView {
                        WrapLayout(horizontalSpacing: 10, verticalSpacing: 14) {
                            ForEach(scanViewModel.filteredIngredients, id: \.self) { ingredient in
                                IngredientTag(text: ingredient.name, isSelected: scanViewModel.selectedIngredients.contains(ingredient), onTap: {
                                    scanViewModel.updateSelectedIngredients(ingredient: ingredient)
                                }, backgroundColor: scanViewModel.selectedIngredients.contains(ingredient) ? Colors.primaryContainer : .white.opacity(0))
                            }
                            HStack {
                                Spacer()
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 1)
                    }
                }
                .onAppear {
                    selectedIngredientsTemp = scanViewModel.selectedIngredients
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            scanViewModel.selectedIngredients = selectedIngredientsTemp
                            print(scanViewModel.selectedIngredients)
                            isAddIngredientsSheetShown = false
                        }, label: {
                            HStack {
                                Image(systemName: "chevron.left")
                                
                                Text("Batal")
                                    .padding(.top, 3)
                            }
                            .font(CustomFont.body)
                            .foregroundColor(Colors.primary)
                        })
                    }
                    
                    ToolbarItem(placement: .principal) {
                        Text("Filter")
                            .font(CustomFont.body)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .padding(.top, 3)
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HStack {
                            Button(action: {
                                selectedIngredientsTemp = scanViewModel.selectedIngredients
                                isAddIngredientsSheetShown = false
                            }, label: {
                                Text("Simpan")
                                    .font(CustomFont.body)
                                    .foregroundColor(Colors.primary)
                            })
                        }
                    }
                }
            .navigationBarTitleDisplayMode(.inline)
            }
            
        }
        .interactiveDismissDisabled(true)
        
    })
    }
}

struct ScanResultView_Previews: PreviewProvider {
    static var previews: some View {
        ScanResultView()
            .environmentObject(ScanViewModel())
    }
}
