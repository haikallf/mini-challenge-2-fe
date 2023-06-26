//
//  Home.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi on 26/06/23.
//

import SwiftUI

struct RecipeContentView: View {
    let recipeId: String
    var safeArea: EdgeInsets
    var size: CGSize
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack{
                // MARK: Image
                Image("dummy-img")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 393, height: 482)
                    .clipped()
                
                RecipeDetailsSheet(recipeId: "1")
            }
            .overlay(alignment: .top) {
                HeaderView()
            }
        }
        .coordinateSpace(name: "SCROLL")
    }
    
    
    
    // MARK: Header View
    @ViewBuilder
    func HeaderView() -> some View {
        GeometryReader{ proxy in
            let minY = proxy.frame(in: .named("SCROLL")).minY
            let height = size.height * 0.45
            let progress = minY / (height * (minY > 0 ? 0.5 : 0.8))
            let titleProgress =  minY / height
            
            HStack(spacing: 15) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .font(.title3)
                        .foregroundColor(.black)
                }
                Spacer(minLength: 0)
                
            }
            .padding(.top, safeArea.top + 10)
            .padding([.horizontal,.bottom], 15)
            .background(
                Color.white
                    .opacity(-progress > 1 ? 1 : 0)
            )
            .offset(y: -minY)
        }
        .frame(height: 35)
    }
}

struct RecipeContentView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader {
            let safeArea = $0.safeAreaInsets
            let size = $0.size
            RecipeContentView(recipeId: "1", safeArea: safeArea, size: size)
                .ignoresSafeArea(.container, edges: .top)
        }
        .preferredColorScheme(.light)
    }
}