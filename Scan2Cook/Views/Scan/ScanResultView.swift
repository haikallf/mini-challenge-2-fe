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
    
    var body: some View {
        VStack {
            //MARK: Image Preview
            Rectangle()
                .fill(.gray)
                .frame(width: 393, height: 278)
            
            //MARK: Ingredients Detail Section
            VStack {
                //MARK: Back Button
                HStack {
                    Image(systemName: "arrow.left")
                    Spacer()
                }
                .padding(.vertical, 12)
                .padding(.horizontal)
                .onTapGesture {
                    presentationMode.wrappedValue.dismiss()
                }
                
                //MARK: Heading
                VStack(alignment: .leading, spacing: 4) {
                    Text("5 Bahan ditemukan")
                        .font(.title3)
                        .fontWeight(.bold)
                    
                    Text("Cek dulu barang yang kamu scan udah bener atau belum~")
                        .font(.footnote)
                }
                .padding(.vertical, 12)
                
                //MARK: Selected Ingredients
                WrapLayout(horizontalSpacing: 10) {
                    ForEach(scanViewModel.selectedIngredients, id: \.self) { ingredient in
                        IngredientTag(text: ingredient, isSelected: true, onTap: {scanViewModel.updateSelectedIngredients(ingredients: ingredient)})
                    }
                    if (scanViewModel.selectedIngredients.count != 0) {
                        HStack {
                            Spacer()
                        }
                    }
                }
                .padding(.horizontal)
                
                Divider()
                    .ignoresSafeArea()
                    .padding(0)
                
                //MARK: SearchBar
                CustomSearchBar(placeholder: "Cari Bahan...", searchText: $scanViewModel.searchText)
                    .padding(.horizontal)
                
                //MARK: Available Ingredients
                ScrollView {
                    WrapLayout(horizontalSpacing: 10, verticalSpacing: 14) {
                        ForEach(scanViewModel.filteredIngredients, id: \.self) { ingredient in
                            IngredientTag(text: ingredient, isSelected: false, onTap: {scanViewModel.updateSelectedIngredients(ingredients: ingredient)})
                        }
                        HStack {
                            Spacer()
                        }
                    }
                    .padding(.horizontal)
                }
            }
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct ScanResultView_Previews: PreviewProvider {
    static var previews: some View {
        ScanResultView().environmentObject(ScanViewModel())
    }
}