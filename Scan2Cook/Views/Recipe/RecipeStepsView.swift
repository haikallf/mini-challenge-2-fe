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
    private let steps: [String] = ["Rebus Indomie ke dalam panci sampai setengah matang. Sambil menunggu indomie setengah matang, Tuangkan bumbu Indomie dan cabai bubuk secukupnya ke dalam piring.", "Tuangkan mie ke dalam piring yang sudah diberi bumbu, lalu aduk rata. Kocok telur dan tambahkan penyedap rasa.", "Campurkan tepung terigu dan maizena ke dalam wadah yang agak besar. Campurkan penyedap rasa dan cabai bubuk secukupnya ke dalam wadah yang berisi tepung terigu dan maizena. Lalu aduk hingga tercampur"]
    
    var timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    private let dotAppearance = UIPageControl.appearance()
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            VStack {
                // MARK: TabView
                TabView(selection: $pageIndex) {
                    ForEach(steps.indices) { idx in
                        // MARK: TabView Adapter
                        VStack(alignment: .leading) {
                            Rectangle().fill(.gray).frame(width: 393, height: 393)
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Step \(idx + 1)")
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.leading)
                                    .fixedSize(horizontal: false, vertical: true)
                                Text(steps[idx])
                                    .font(.title2)
                                    .multilineTextAlignment(.leading)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                            .padding(.horizontal)
                            
                            Spacer()
                        }
                        .tag(idx + 1)
                    }
                }
                .animation(.easeInOut, value: pageIndex)
                .tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .interactive))
                //            .onAppear {
                //                dotAppearance.currentPageIndicatorTintColor = UIColor(.black)
                //                dotAppearance.pageIndicatorTintColor = UIColor(.gray)
                //            }
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
                            .background(.black)
                            .cornerRadius(12)
                    })
                    Spacer()
                    
                    DotIndicator(currentIndex: $pageIndex, maxIndex: steps.count)
                    
                    Spacer()
                    
                    Button(action: {
                        incrementPage()
                    }, label: {
                        Text(isLastPage() ? "Selesai" : "→")
                            .padding(.vertical, 14)
                            .padding(.horizontal, 20)
                            .foregroundColor(.white)
                            .background(.black)
                            .cornerRadius(12)
                            .minimumScaleFactor(0.01)
                    })
                }
                .padding(.horizontal)
            }
            
            VStack {
                BackButton()
                
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
        RecipeStepsView()
    }
}
