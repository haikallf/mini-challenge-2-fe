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
        VStack {
            //MARK: Image Preview
            Rectangle()
                .fill(.gray)
                .frame(width: 393, height: 278)
                .overlay {
                    VStack {
                        //MARK: Back Button
                        BackButton()
                        Spacer()
                    }
                }
            
            //MARK: Ingredients Detail Section
            VStack {
                //MARK: Heading
                VStack(alignment: .leading, spacing: 4) {
                    Text("5 Bahan ditemukan")
                        .font(.title3)
                        .fontWeight(.bold)
                    
                    Text("Cek dulu barang yang kamu scan udah bener atau belum~")
                        .font(.footnote)
                }
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
                    }, backgroundColor: .green.opacity(0.2))
                    HStack {
                        Spacer()
                    }
//                    if (scanViewModel.selectedIngredients.count != 0) {
//                        HStack {
//                            Spacer()
//                        }
//                    }
                }
                .padding(.horizontal, 20)
            }
            
            Spacer()
            
            //MARK: Search Button
            CupertinoButton("Lanjut", action: {
                shouldNavigate = true
            })
                .padding(.horizontal)
            
            //MARK: Navigate to SearchResult triggered by shouldNavigate
            NavigationLink(destination: SearchResultView(), isActive: $shouldNavigate) {
                EmptyView()
            }
            .opacity(0)
        }
        .onAppear {
            selectedIngredientsTemp = scanViewModel.selectedIngredients
        }
        .navigationBarBackButtonHidden(true)
        .sheet(isPresented: $isAddIngredientsSheetShown, content: {
            NavigationView {
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
                                }, backgroundColor: scanViewModel.selectedIngredients.contains(ingredient) ? .orange.opacity(0.2) : .white.opacity(0))
                            }
                            HStack {
                                Spacer()
                            }
                        }
                        .padding(.horizontal, 20)
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
                            }
                        })
                    }
                    
                    ToolbarItem(placement: .principal) {
                        Text("Filter")
                            .fontWeight(.semibold)
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HStack {
                            Button("Simpan", action: {
                                selectedIngredientsTemp = scanViewModel.selectedIngredients
                                isAddIngredientsSheetShown = false
                            })
                        }
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
            }
            .interactiveDismissDisabled(true)
        })
    }
}

struct ScanResultView_Previews: PreviewProvider {
    static var previews: some View {
        ScanResultView().environmentObject(ScanViewModel())
    }
}
