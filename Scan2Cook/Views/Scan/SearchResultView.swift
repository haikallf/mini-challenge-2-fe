//
//  SearchResultView.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi on 26/06/23.
//

import SwiftUI

struct SearchResultView: View {
    @State var recipes: [RecipeThumbnailResponse] = []
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            BackButton()
            
            VStack(alignment: .leading, spacing: 4) {
                Text("5 Resep Ditemuin")
                    .font(.title3)
                    .fontWeight(.semibold)
                
                Text("Ada aja deh yang cocok sama bahan yang kamu punya")
                    .font(.footnote)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 12)
            .padding(.horizontal)
            
            RecipeLists(recipes: recipes)
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct SearchResultView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultView()
    }
}
