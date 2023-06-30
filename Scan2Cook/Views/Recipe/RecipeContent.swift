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
    
    @ObservedObject var viewModel = RecipeDetailsViewModel()
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var animation: Animation {
        Animation.easeOut(duration: 0.4)
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack{
                
                if let url = URL(string: viewModel.recipeDetails?.image ?? "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg?20200913095930") {
                       AsyncImage(url: url) { image in
                           image
                               .resizable()
                               .aspectRatio(contentMode: .fill)
                               .frame(width: 393, height: 482)
                               .clipped()
                       } placeholder: {
                           // Placeholder view while the image is loading
                           ProgressView()
                       }
                   } else {
                       // View to display when the URL is invalid or nil
                       Text("Invalid URL")
                           .foregroundColor(.red)
                   }
               
                
//                // MARK: Image
//                Image("dummy-img")
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 393, height: 482)
//                    .clipped()
                
                RecipeDetailsSheet(recipeId: recipeId)
            }
            .overlay(alignment: .top) {
                HeaderView()
            }
        }
        .onReceive(viewModel.$recipeDetails) { _ in
            print("Re-rendering")
        }
        .onAppear {
            viewModel.getRecipeById(recipeId: recipeId)
            print(viewModel.recipeDetails)
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
            
            BackButton(isCircleButton: -progress > 1 ? false : true)
                .animation(animation, value: -progress > 1)
                .padding(.top, safeArea.top + 10)
                .background(
                    Colors.background
                        .opacity(-progress > 1 ? 1 : 0)
                        .animation(Animation.easeOut(duration: 0.1))
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
