//
//  RecipeDetailsView.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 23/06/23.
//

import SwiftUI

struct RecipeDetailsSheet: View {
    let recipeId: String
    
    @StateObject var viewModel = RecipeDetailsViewModel()
    @State private var shouldNavigate: Bool = false
    
    @State var portionCount: Int = 1
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            Colors.background
                .ignoresSafeArea()
            
            ScrollView {
                //MARK: Recipe Title
                Text("\(viewModel.recipeDetails?.nama_resep ?? "")")
                    .font(CustomFont.title5)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .padding()
                
                //MARK: General Menu Info
                VStack(spacing: 12) {
                    HStack(spacing: 8) {
                        Image(systemName: "timer")
                            .fontWeight(.medium)
                        Text("Estimasi Pembuatan")
                        Spacer()
                        Text("\(viewModel.recipeDetails?.estimasi ?? 0) Menit")
                    }
                    HStack(spacing: 8) {
                        Image(systemName: "flame.fill")
                            .fontWeight(.medium)
                        Text("Saran Penyajian")
                        Spacer()
                        Text("1 Porsi")
                    }
                    HStack(spacing: 8) {
                        Image(systemName: "fork.knife")
                            .fontWeight(.medium)
                        Text("Alat Masak")
                        Spacer()
                        Text("2 Alat Masak")
                    }
                }
                .font(CustomFont.caption)
                .foregroundColor(.black)
                .padding()
                .background(Colors.surfaceContainerHigh)
                
                //MARK: Ingredients
                VStack(spacing: 12) {
                    Text("Bahan-bahan")
                        .font(CustomFont.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                    
                    //MARK: Portion Counter
                    HStack(alignment: .bottom, spacing: 4) {
                        Text(String(portionCount))
                            .font(CustomFont.title5)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                        Text("Jumlah porsi")
                            .font(CustomFont.footnote)
                            .padding(.bottom, 2)
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        HStack(spacing: 14.5) {
                            Button(action: {
                                if (portionCount > 1) { portionCount = portionCount - 1 }
                            }, label: {
                                Image(systemName: "minus")
                                    .foregroundColor(.black)
                            })
                            
                            Divider()
                                .foregroundColor(Color("labelsTertiary"))
                            
                            Button(action: {
                                portionCount = portionCount + 1
                            }, label: {
                                Image(systemName: "plus")
                                    .foregroundColor(.black)
                            })
                        }
                        .padding(.horizontal, 15)
                        .padding(.vertical, 5)
                        .background(Color("fillsTertiary"))
                        .cornerRadius(8)
                    }
                    
                    //MARK: Owned Ingredients
                    VStack(spacing: 12) {
                        HStack(spacing: 8) {
                            Image(systemName: "checkmark.circle")
                                .fontWeight(.semibold)
                            
                            Text("Bahan Yang Kamu Miliki")
                                .font(CustomFont.subheadline)
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(.leading)
                        }
                        .foregroundColor(Colors.onTertiaryContainer)
                        
                        Group {
                            ForEach(viewModel.recipeDetails?.bahans ?? IngredientResponse.emptyState) { bahan in
                                if (bahan.tipe_bahan == 1) {
                                    HStack {
                                            if (bahan.jumlah != nil) {
                                                Text("\(bahan.jumlah! * portionCount) \(bahan.satuan )")
                                            } else {
                                                Text("\(bahan.satuan )")
                                            }
                                        
                                        
                                        Spacer()
                                        
                                        Text(bahan.tagbahan.nama_tag)
                                    }
                                }
                            }
                        }
                        .font(CustomFont.footnote)
                    }
                    .padding(12)
                    .background(Colors.tertiaryContainer)
                    .foregroundColor(.black)
                    .cornerRadius(8)
                    
                    //MARK: Not Owned Ingredients
                    VStack(spacing: 12) {
                        HStack(spacing: 8) {
                            Image(systemName: "xmark.circle")
                                .fontWeight(.semibold)
                            
                            Text("Bahan yang tidak kamu miliki")
                                .font(CustomFont.subheadline)
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(.leading)
                        }
                        .foregroundColor(Colors.thunderbird20)
                        
                        Group {
                            HStack {
                                Text("250 gram")
                                
                                Spacer()
                                
                                Text("Tepung Terigu")
                            }
                            HStack {
                                Text("150 gram")
                                
                                Spacer()
                                
                                Text("Maizena")
                            }
                            HStack {
                                Text("1 bungkus")
                                
                                Spacer()
                                
                                Text("Cabai Bubuk")
                            }
                            HStack {
                                Text("2 sdt")
                                
                                Spacer()
                                
                                Text("Kaldu Bubuk")
                            }
                        }
                        .font(CustomFont.footnote)
                    }
                    .padding(12)
                    .background(Colors.thunderbird87)
                    .foregroundColor(.black)
                    .cornerRadius(8)
                    
                    //MARK: Additional Ingredients
                    VStack(spacing: 12) {
                        Text("Bahan Tambahan")
                            .font(CustomFont.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(Colors.AAA)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.leading)
                        
                        Group {
                            ForEach(viewModel.recipeDetails?.bahans ?? IngredientResponse.emptyState) { bahan in
                                if (bahan.tipe_bahan == 0) {
                                    HStack {
                                        if (bahan.jumlah != nil) {
                                            Text("\(bahan.jumlah! * portionCount) \(bahan.satuan )")
                                        } else {
                                            Text("\(bahan.satuan )")
                                        }
                                        
                                        Spacer()
                                        
                                        Text(bahan.tagbahan.nama_tag)
                                    }
                                }
                            }
                        }
                        .font(CustomFont.footnote)
                    }
                    .padding(12)
                    .background(Colors.card1)
                    .foregroundColor(.black)
                    .cornerRadius(8)
                }
                .padding()
                
                //MARK: Tools
                VStack(alignment: .leading, spacing: 12) {
                    Text("Alat Masak")
                        .font(CustomFont.body)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    Text(viewModel.cookingwares)
                        .font(CustomFont.subheadline)
                        .foregroundColor(Colors.AA)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                
                //MARK: Cooking Steps
                VStack(alignment: .leading, spacing: 16) {
                    Text("Langkah Masak")
                        .font(CustomFont.body)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    //MARK: STEPS
                    ForEach(Array(viewModel.recipeDetails?.langkah_masak.enumerated() ?? [].enumerated()), id: \.element) { index, element in
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Step \(index + 1)")
                                .font(CustomFont.body)
                                .fontWeight(.bold)
                                .foregroundColor(.black)

                            Text(element)
                                .font(CustomFont.subheadline)
                                .foregroundColor(Colors.AA)
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                
                HStack(spacing: 10) {
                    CupertinoButton("Mulai Masak", action: {shouldNavigate = true})
                    
                    Button(action: {}, label: {
                        Image(systemName: "bookmark")
                            .foregroundColor(.black)
                    })
                    .frame(width: 50, height: 50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(.black, lineWidth: 1)
                    )
                    .cornerRadius(50)
                }
                .padding(.vertical, 14)
                .padding(.horizontal)
                
                //MARK: Navigate to RecipeStepsView triggered by shouldNavigate
                NavigationLink(destination: RecipeStepsView(), isActive: $shouldNavigate) {
                    EmptyView()
                }
                .opacity(0)
                
                Spacer()
            }
        }
        
        .onReceive(viewModel.$recipeDetails) { _ in
            print("Re-rendering")
        }
        .onAppear {
            viewModel.getRecipeById(recipeId: recipeId)
            print(viewModel.recipeDetails)
        }
    }
}

struct RecipeDetailsSheet_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailsSheet(recipeId: "1")
    }
}

struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGPoint = .zero

    static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {
    }
}
