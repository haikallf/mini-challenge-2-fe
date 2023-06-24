//
//  RecipeDetailsView.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 23/06/23.
//

import SwiftUI

struct RecipeDetailsSheet: View {
    let recipeId: String
    
    @State private var scrollPosition: CGPoint = .zero
    @State private var scrolledDown = false
    
    @State var portionCount: Int = 1
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ScrollViewReader { scrollViewProxy in
            ScrollView {
                //MARK: Recipe Title
                Text("x: \(scrollPosition.x), y: \(scrollPosition.y), scrollUp: \(String(scrolledDown))")
                    .font(.title2)
                    .fontWeight(.bold)
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
                .font(.caption)
                .padding()
                .background(Color("fillsQuarternary"))
                
                //MARK: Ingredients
                VStack(spacing: 12) {
                    Text("Bahan-bahan")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                    
                    //MARK: Portion Counter
                    HStack(alignment: .bottom, spacing: 4) {
                        Text(String(portionCount))
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text("Jumlah porsi")
                            .font(.footnote)
                            .padding(.bottom, 2)
                        
                        Spacer()
                        
                        HStack(spacing: 14.5) {
                            Button(action: {
                                if (portionCount > 1) { portionCount = portionCount - 1 }
                            }, label: {
                                Image(systemName: "minus")
                            })
                            
                            Divider()
                            
                            Button(action: {
                                portionCount = portionCount + 1
                            }, label: {
                                Image(systemName: "plus")
                            })
                        }
                        .padding(.horizontal, 15)
                        .padding(.vertical, 5)
                        .background(Color("fillsTertiary"))
                        .cornerRadius(8)
                    }
                    
                    //MARK: Main Ingredients
                    VStack(spacing: 12) {
                        Text("Bahan Utama")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.leading)
                        
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
                        .font(.subheadline)
                    }
                    .padding(12)
                    .background(Color("fillsTertiary"))
                    .cornerRadius(8)
                    
                    //MARK: Additional Ingredients
                    VStack(spacing: 12) {
                        Text("Bahan Tambahan")
                            .font(.subheadline)
                            .fontWeight(.semibold)
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
                        .font(.subheadline)
                    }
                    .padding(12)
                    .background(Color("fillsTertiary"))
                    .cornerRadius(8)
                }
                .padding()
                
                //MARK: Tools
                VStack(alignment: .leading, spacing: 12) {
                    Text("Alat Masak")
                        .fontWeight(.bold)
                    Text("Panci, Gelas, Piring, & Penggorengan")
                        .font(.subheadline)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                
                //MARK: Cooking Steps
                VStack(alignment: .leading, spacing: 16) {
                    Text("Langkah Masak")
                        .fontWeight(.semibold)
                    
                    //MARK: STEPS
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Step 1")
                            .fontWeight(.semibold)
                        Text("Rebus Indomie ke dalam panci sampai setengah matang. Sambil menunggu indomie setengah matang, Tuangkan bumbu Indomie dan cabai bubuk secukupnya ke dalam piring.")
                            .font(.subheadline)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Step 2")
                            .fontWeight(.semibold)
                        Text("Tuangkan mie ke dalam piring yang sudah diberi bumbu, lalu aduk rata. Kocok telur dan tambahkan penyedap rasa.")
                            .font(.subheadline)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Step 3")
                            .fontWeight(.semibold)
                        Text("Campurkan tepung terigu dan maizena ke dalam wadah yang agak besar. Campurkan penyedap rasa dan cabai bubuk secukupnya ke dalam wadah yang berisi tepung terigu dan maizena. Lalu aduk hingga tercampur")
                            .font(.subheadline)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                
                HStack(spacing: 10) {
                    CupertinoButton("Mulai Masak", action: {})
                    
                    Button(action: {}, label: {
                        Image(systemName: "bookmark")
                    })
                    .frame(width: 50, height: 50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .cornerRadius(50)
                }
                .padding(.vertical, 14)
                .padding(.horizontal)
                
                Spacer()
            }
            .onAppear {
                scrollViewProxy.scrollTo(1)
            }
            .gesture(DragGesture().onChanged { value in
                scrolledDown = value.translation.height > 0
            })
            .background(GeometryReader { geometry in
                Color.clear
                    .preference(key: ScrollOffsetPreferenceKey.self, value: geometry.frame(in: .named("scroll")).origin)
            })
            .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                self.scrollPosition = value
        }
        }
    }
}

struct RecipeDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailsView(recipeId: "1")
    }
}

struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGPoint = .zero

    static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {
    }
}
