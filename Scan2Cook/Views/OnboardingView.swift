//
//  OnboardingView.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 20/06/23.
//

import SwiftUI

struct OnboardingView: View {
    @State private var pageIndex = 1
    private let onboardings: [Onboarding] = Onboarding.all
    
    var timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    private let dotAppearance = UIPageControl.appearance()
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Lewati")
            }
            .padding(.horizontal)
            .padding(.vertical, 11)
            
            TabView(selection: $pageIndex) {
                ForEach(onboardings, id: \.id) { onboarding in
                    VStack(alignment: .leading) {
                        Rectangle().fill(.gray).frame(width: 393, height: 491)
                        VStack(alignment: .leading, spacing: 8) {
                            Text(onboarding.title)
                                .font(.title2)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.leading)
                            Text(onboarding.content)
                                .multilineTextAlignment(.leading)
                        }
                        .padding(.horizontal)
                        
                        Spacer()
                    }
                    .tag(onboarding.id)
                }
            }
            .animation(.easeInOut, value: pageIndex)
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .interactive))
            .onAppear {
                dotAppearance.currentPageIndicatorTintColor = UIColor(.black)
                dotAppearance.pageIndicatorTintColor = UIColor(.gray)
            }
            .padding(.bottom, 10)
//            .onReceive(timer, perform: { _ in
//                withAnimation {
//                    pageIndex = pageIndex < onboardings.count ? pageIndex + 1 : 1
//                }
//
//            })
            
            Button(action: {}) {
                Text("Selesai")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.black)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .padding()
            }
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
