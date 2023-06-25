//
//  HomeView.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 21/06/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                //MARK: Heading
                VStack(spacing: 2) {
                    HStack {
                        Text("Halo, Friend!")
                            .font(.subheadline)
                        Spacer()
                    }
                    HStack {
                        Text("Selamat Siang")
                            .font(.title2)
                            .fontWeight(.bold)
                        Spacer()
                    }
                }
                .padding(.vertical, 12)
                .padding(.leading, 16)
                
                //MARK: Today's Recipe Section
                VStack(alignment: .leading, spacing: 14) {
                    HStack {
                        Text("Resep Hari Ini")
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        Text("Lihat Semua →")
                            .font(.footnote)
                            .fontWeight(.semibold)
                    }
                    .padding(.horizontal, 16)
                    
                    HorizontalScrollViewMenu(recipes: viewModel.todaysRecipes, isSmall: false)
                    .padding(.leading, 16)
                }
                .padding(.vertical, 14)
                
                //MARK: Newly Added Recipe Section
                VStack(alignment: .leading, spacing: 14) {
                    HStack {
                        Text("Resep Terbaru")
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        Text("Lihat Semua →")
                            .font(.footnote)
                            .fontWeight(.semibold)
                    }
                    .padding(.horizontal, 16)
                    
                    HorizontalScrollViewMenu(recipes: viewModel.newestRecipes, isSmall: false)
                    .padding(.leading, 16)
                }
                .padding(.vertical, 14)
                
                Spacer()
            }
            .padding(.bottom, 52)
        }
        .frame(maxWidth: .infinity)
        .navigationBarBackButtonHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
