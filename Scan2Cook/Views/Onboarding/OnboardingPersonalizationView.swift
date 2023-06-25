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
    
    @State private var shouldNavigate: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            // MARK: Skip Button
            HStack {
                Spacer()
                NavigationLink(destination: MainView()) {
                    Text("Lewati")
                        .foregroundColor(.black)
                }
            }
            .padding(.vertical, 11)
            
            //MARK: Heading Section
            VStack(alignment: .leading, spacing: 6) {
                //MARK: Page Heading
                Text("Personalisasi Akun")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                
                //MARK: Page Subheading
                Text("Cupcake ipsum dolor sit amet cookie. Oat cake apple pie sweet dessert jujubes brownie.")
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
            }
            .padding(.vertical, 12)
            
            //MARK: Personalization Section
            VStack(alignment: .leading, spacing: 14) {
                Text("Aku ga bisa makan...")
                    .font(.title3)
                    .fontWeight(.semibold)
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
            }
            .padding(.vertical, 12)
            
            Spacer()
            
            CupertinoButton("Lanjut", action: {viewModel.setPersonalizations()
                shouldNavigate=true
            }, isDisabled: viewModel.personalizations.isEmpty)
            
            //MARK: Navigate to MainView triggered by shouldNavigate
            NavigationLink(destination: MainView(), isActive: $shouldNavigate) {
                EmptyView()
            }
            .opacity(0)
        }
        .padding(.horizontal)
        .navigationBarBackButtonHidden(true)
        .onAppear {
            print(viewModel.personalizations)
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
