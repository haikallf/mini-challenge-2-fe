//
//  OnboardingView.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 20/06/23.
//

import SwiftUI

struct OnboardingView: View {
    @State private var pageIndex = 1
    
    var body: some View {
        VStack {
            // MARK: TabView
            TabView(selection: $pageIndex) {
                OnboardingContent1(pageIndex: $pageIndex)
                    .tag(1)
                    .contentShape(Rectangle()).gesture(DragGesture())
                
                OnboardingContent2(pageIndex: $pageIndex)
                    .tag(2)
                    .contentShape(Rectangle()).gesture(DragGesture())
                
                OnboardingContent3(pageIndex: $pageIndex)
                    .tag(3)
                    .contentShape(Rectangle()).gesture(DragGesture())
                
            }
            .animation(.easeInOut, value: pageIndex)
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
        .navigationBarBackButtonHidden(true)
        
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
