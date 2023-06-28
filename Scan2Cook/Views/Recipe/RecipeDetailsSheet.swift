//
//  RecipeDetailsView.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 23/06/23.
//

import SwiftUI

struct RecipeDetailsSheet: View {
    let recipeId: String
    
    @State private var shouldNavigate: Bool = false
    
    @State var portionCount: Int = 1
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            Colors.background
                .ignoresSafeArea()
            
            ScrollView {
                //MARK: Recipe Title
                Text("\(Recipe.all[(Int(recipeId) ?? 0) - 1].name)")
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
                        Text("5 Menit")
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
                            HStack {
                                Text("2 bungkus")
                                
                                Spacer()
                                
                                Text("Indomie")
                            }
                            HStack {
                                Text("2 butir")
                                
                                Spacer()
                                
                                Text("Telur")
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
                    
                    Text("Panci, Gelas, Piring, & Penggorengan")
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
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Step 1")
                            .font(CustomFont.body)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                        Text("Rebus Indomie ke dalam panci sampai setengah matang. Sambil menunggu indomie setengah matang, Tuangkan bumbu Indomie dan cabai bubuk secukupnya ke dalam piring.")
                            .font(CustomFont.subheadline)
                            .foregroundColor(Colors.AA)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Step 2")
                            .font(CustomFont.body)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                        Text("Tuangkan mie ke dalam piring yang sudah diberi bumbu, lalu aduk rata. Kocok telur dan tambahkan penyedap rasa.")
                            .font(CustomFont.subheadline)
                            .foregroundColor(Colors.AA)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Step 3")
                            .font(CustomFont.body)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                        Text("Campurkan tepung terigu dan maizena ke dalam wadah yang agak besar. Campurkan penyedap rasa dan cabai bubuk secukupnya ke dalam wadah yang berisi tepung terigu dan maizena. Lalu aduk hingga tercampur")
                            .font(CustomFont.subheadline)
                            .foregroundColor(Colors.AA)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
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
