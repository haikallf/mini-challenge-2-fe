//
//  RecipeDetailsView.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi on 26/06/23.
//

import SwiftUI

struct RecipeDetailsView: View {
    let recipeId: String
    @State var _size: CGSize = CGSize(width: 0, height: 0)
    
    var body: some View {
        GeometryReader {
            let safeArea = $0.safeAreaInsets
            let size = $0.size
            ZStack {
                Colors.background
                    .ignoresSafeArea()
                
                RecipeContentView(recipeId: recipeId, safeArea: safeArea, size: size)
                    .ignoresSafeArea(.container, edges: .top)
            }
        }
        .navigationBarBackButtonHidden(true)
        .preferredColorScheme(.light)
        .onAppear {
            print(recipeId)
        }
    }
}

struct RecipeDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailsView(recipeId: "1")
    }
}
