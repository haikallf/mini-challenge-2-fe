//
//  OnboardingView.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 20/06/23.
//

import SwiftUI

struct OnboardingView: View {
    @State private var pageIndex = 1
    @State var arr: [String] = ["Halo1", "Halo2", "Halo3"]
    
    var timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    private let dotAppearance = UIPageControl.appearance()
    
    var body: some View {
        VStack {
            TabView(selection: $pageIndex) {
                ForEach(arr, id: \.self) { elmt in
                    VStack {
                        Text(elmt)
                    }
                    .tag(elmt)
                }
            }
            .animation(.easeInOut, value: pageIndex)
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .interactive))
            .onAppear {
                dotAppearance.currentPageIndicatorTintColor = UIColor(.gray)
                dotAppearance.pageIndicatorTintColor = UIColor(Color("grayBg"))
            }
            .frame(maxHeight: 480)
            .padding(.bottom, 10)
            .onReceive(timer, perform: { _ in
                withAnimation {
                    pageIndex = pageIndex < arr.count ? pageIndex + 1 : 1
                }

            })
        }
    }
    
    func incrementPage() {
        pageIndex += 1
    }
    
    func goToFirst() {
        pageIndex = 1
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
