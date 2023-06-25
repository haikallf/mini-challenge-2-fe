//
//  OnboardingView.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 20/06/23.
//

import SwiftUI

struct OnboardingView: View {
    @State private var shouldNavigate: Bool = false
    @State private var pageIndex = 1
    private let onboardings: [Onboarding] = Onboarding.all
    
    var timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            // MARK: Skip Button
            HStack {
                Spacer()
                NavigationLink(destination: OnboardingPersonalizationView()) {
                    Text("Lewati")
                        .foregroundColor(.black)
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 11)
            
            // MARK: TabView
            TabView(selection: $pageIndex) {
                ForEach(onboardings, id: \.id) { onboarding in
                    // MARK: TabView Adapter
                    VStack(alignment: .leading) {
                        Rectangle().fill(.gray).frame(width: 393, height: 491)
                        VStack(alignment: .leading, spacing: 8) {
                            Text(onboarding.title)
                                .font(.title2)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.leading)
                                .fixedSize(horizontal: false, vertical: true)
                            Text(onboarding.content)
                                .font(.subheadline)
                                .multilineTextAlignment(.leading)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        .padding(.horizontal)
                        
                        Spacer()
                    }
                    .tag(onboarding.id)
                }
            }
            .animation(.easeInOut, value: pageIndex)
            .tabViewStyle(.page(indexDisplayMode: .never))
//            .padding(.bottom, 10)
//            .onReceive(timer, perform: { _ in
//                withAnimation {
//                    pageIndex = pageIndex < onboardings.count ? pageIndex + 1 : 1
//                }
//
//            })
            
            HStack() {
                PillIndicator(currentIndex: $pageIndex, maxIndex: onboardings.count)
                Spacer()
            }
            .padding()
            
            
            CupertinoButton(isLastPage() ? "Selesai" : "Lanjut", action: isLastPage() ?  {shouldNavigate = true} : {incrementPage()})
                .padding(.horizontal)
            
            //MARK: Navigate to PersonalizationView triggered by shouldNavigate
            NavigationLink(destination: OnboardingPersonalizationView(), isActive: $shouldNavigate) {
                EmptyView()
            }
            .opacity(0)
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func incrementPage() {
        pageIndex += 1
    }
    
    func isLastPage() -> Bool {
        return pageIndex == onboardings.count
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
