//
//  OnboardingPersonalizationView.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 21/06/23.
//

import SwiftUI
import WrapLayout

struct OnboardingPersonalizationView: View {
    @StateObject var viewModel = PersonalizationViewModel()
    @State var runAnimation = false
    @State var isAnimationRun = false
    
    @State private var shouldNavigate: Bool = false
    
    var animation: Animation {
        Animation.easeOut(duration: 1)
    }
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Colors.background
                .ignoresSafeArea()
            //MARK: Bottom Circle
            Circle()
                .fill(Colors.tertiaryContainer)
                .frame(width: 439)
                .offset(x: 0,  y: runAnimation ? UIScreen.main.bounds.height - 500 : UIScreen.main.bounds.height)
                .animation(animation)
            
            VStack(alignment: .leading) {
                //MARK: Personalization Section
                VStack(alignment: .leading, spacing: 14) {
                    Text("Oke, \(viewModel.username). Ada makanan yang kamu **hindarin** gak?")
                        .font(CustomFont.epilogue(size: 28))
                        .foregroundColor(Colors.AAA)
                        .opacity(runAnimation ? 1 : 0)
                        .animation(animation.delay(1))
                    
                    WrapLayout(horizontalSpacing: 14, verticalSpacing: 14) {
                        PersonalizationTag("Laktosa", emoji: "🥛", isSelected: viewModel.personalizations.contains(
                            getPersonalizationType(personalization: PersonalizationType.laktosa)
                        ), action:  {
                            viewModel.updatePersonalizations(
                                personalization: getPersonalizationType(personalization: PersonalizationType.laktosa)
                            )
                        })
                        
                        PersonalizationTag("Seafood", emoji: "🐟", isSelected: viewModel.personalizations.contains(
                            getPersonalizationType(personalization: PersonalizationType.seafood)
                        ), action:  {
                            viewModel.updatePersonalizations(
                                personalization: getPersonalizationType(personalization: PersonalizationType.seafood)
                            )
                        })
                        
                        PersonalizationTag("Kacang", emoji: "🥜", isSelected: viewModel.personalizations.contains(
                            getPersonalizationType(personalization: PersonalizationType.kacang)
                        ), action:  {
                            viewModel.updatePersonalizations(
                                personalization: getPersonalizationType(personalization: PersonalizationType.kacang)
                            )
                        })
                        
                        PersonalizationTag("Babi", emoji: "🐷", isSelected: viewModel.personalizations.contains(
                            getPersonalizationType(personalization: PersonalizationType.babi)
                        ), action:  {
                            viewModel.updatePersonalizations(
                                personalization: getPersonalizationType(personalization: PersonalizationType.babi)
                            )
                        })
                    }
                    .opacity(runAnimation ? 1 : 0)
                    .animation(isAnimationRun ? Animation.linear(duration: 0) : animation.delay(2))
                }
                .padding(.vertical, 12)
            }
            .padding(.horizontal, 40)
            
            //MARK: Continue Button
            VStack {
                Spacer()
                
                CupertinoButton(viewModel.personalizations.count == 0 ? "Aku Makan Semuanya" : "Lanjut", action: {
                    viewModel.setPersonalizations()
                    shouldNavigate = true
                })
                
                //MARK: Navigate to MainView triggered by shouldNavigate
                NavigationLink(destination: MainView(), isActive: $shouldNavigate) {
                    EmptyView()
                }
                .opacity(0)
            }
            .padding(.horizontal, 40)
            .opacity(runAnimation ? 1 : 0)
            .animation(isAnimationRun ? Animation.linear(duration: 0) : animation.delay(3))
            .onReceive(timer) { time in
                isAnimationRun = true
                timer.upstream.connect().cancel()
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            viewModel.clearPersonalization()
            runAnimation = true
        }
        .onDisappear {
            UserDefaults.standard.set(true, forKey: "isNotFirstTimer")
        }
    }
}

struct OnboardingPersonalizationView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPersonalizationView()
    }
}
