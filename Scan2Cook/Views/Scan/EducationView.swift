//
//  EducationView.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi on 25/06/23.
//

import SwiftUI

struct EducationView: View {
    @State private var pageIndex = 1
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    private let onboardings: [Education] = Education.all
    
    var timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            // MARK: Skip Button
            BackButton()
            
            // MARK: TabView
            TabView(selection: $pageIndex) {
                
                ForEach(Array(onboardings.enumerated()), id: \.element) { idx, onboarding in
                    // MARK: TabView Adapter
                    VStack(alignment: .leading, spacing: 16) {
                        VStack(alignment: .leading, spacing: 16) {
                            Text(onboarding.title)
                                .font(CustomFont.title3)
                                .foregroundColor(Colors.AAA)
                                .multilineTextAlignment(.leading)
                                .fixedSize(horizontal: false, vertical: true)
                            
                            Text(onboarding.content)
                                .font(CustomFont.body)
                                .foregroundColor(Colors.AAA)
                                .multilineTextAlignment(.leading)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        .padding(.horizontal)
                        
                        Image("education-\(idx + 1)")
                            .resizable()
                            .frame(width: 361, height: 203.06)
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
                Button(action: {
                    incrementPage()
                }, label: {
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
                })
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func incrementPage() {
        if (isLastPage()) {
            presentationMode.wrappedValue.dismiss()
        } else {
            pageIndex += 1
        }
    }
    
    func isLastPage() -> Bool {
        return pageIndex == onboardings.count
    }
}

struct EducationView_Previews: PreviewProvider {
    static var previews: some View {
        EducationView()
    }
}
