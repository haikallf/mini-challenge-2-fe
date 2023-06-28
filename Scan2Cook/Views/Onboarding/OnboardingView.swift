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
            if (pageIndex == 1) {
                OnboardingContent1(pageIndex: $pageIndex)
            } else if (pageIndex == 2) {
                OnboardingContent2(pageIndex: $pageIndex)
            } else if (pageIndex == 3) {
                OnboardingContent3(pageIndex: $pageIndex)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
