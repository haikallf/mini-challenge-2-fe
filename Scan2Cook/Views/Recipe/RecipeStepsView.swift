//
//  RecipeStepsView.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi on 25/06/23.
//

import SwiftUI

struct RecipeStepsView: View {
    @State private var shouldNavigate: Bool = false
    @State private var pageIndex = 1
    var steps: [String]
    var imageURLs: [String]
    
    var timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    private let dotAppearance = UIPageControl.appearance()
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            Colors.background
                .ignoresSafeArea()
            
            VStack {
                // MARK: TabView
                TabView(selection: $pageIndex) {
                    if (steps.count > 0) {
                        ForEach(steps.indices) { idx in
                            // MARK: TabView Adapter
                            VStack(alignment: .leading) {
                                if let url = URL(string: imageURLs[idx] ) {
                                   AsyncImage(url: url) { image in
                                       image
                                           .resizable()
                                           .aspectRatio(contentMode: .fill)
                                           .frame(width: 393, height: 393)
                                           .clipped()
                                   } placeholder: {
                                       // Placeholder view while the image is loading
                                       ProgressView()
                                           .frame(width: 393, height: 482)
                                   }
                               } else {
                                   // View to display when the URL is invalid or nil
                                   VStack {
                                       Text("Invalid URL")
                                   }
                                   .frame(width: 393, height: 482)
                                   .background(Colors.disabled)
                               }
                                
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("STEP \(idx + 1)")
                                        .font(CustomFont.body)
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                        .multilineTextAlignment(.leading)
                                        .fixedSize(horizontal: false, vertical: true)
                                    
                                    Text(steps[idx])
                                        .font(CustomFont.title4)
                                        .foregroundColor(Colors.AA)
                                        .multilineTextAlignment(.leading)
                                        .fixedSize(horizontal: false, vertical: true)
                                }
                                .padding()
                                
                                Spacer()
                            }
                            .tag(idx + 1)
                        }
                    }
                }
                .animation(.easeInOut, value: pageIndex)
                .tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .interactive))
                .padding(.bottom, 10)
                
                HStack {
                    Button(action: {
                        decrementPage()
                    }, label: {
                        Text("←")
                            .padding(.vertical, 14)
                            .padding(.horizontal, 20)
                            .frame(maxWidth: 56)
                            .foregroundColor(.white)
                            .background(isFirstPage() ? Colors.disabled : Colors.secondary)
                            .cornerRadius(12)
                            .disabled(isFirstPage())
                    })
                    Spacer()
                    
                    if (steps.count > 0) {
                        DotIndicator(currentIndex: $pageIndex, maxIndex: steps.count)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        incrementPage()
                    }, label: {
                        Text(isLastPage() ? "Selesai" : "→")
                            .padding(.vertical, 14)
                            .padding(.horizontal, 20)
                            .foregroundColor(.white)
                            .background(Colors.secondary)
                            .cornerRadius(12)
                            .minimumScaleFactor(0.01)
                    })
                }
                .padding(.horizontal)
            }
            
            VStack {
                BackButton(isCircleButton: true)
                
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func incrementPage() {
        if (!isLastPage()) {
            pageIndex += 1
        } else {
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func decrementPage() {
        if (!isFirstPage()) {
            pageIndex -= 1
        }
    }
    
    func isFirstPage() -> Bool {
        return pageIndex == 1
    }
    
    func isLastPage() -> Bool {
        return pageIndex == steps.count
    }
}

struct RecipeStepsView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeStepsView(steps: [], imageURLs: [])
    }
}
