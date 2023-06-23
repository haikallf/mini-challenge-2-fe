//
//  OnboardingPersonalizationView.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 21/06/23.
//

import SwiftUI

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
            
            //MARK: Section 1
            VStack(alignment: .leading, spacing: 14) {
                Text("Aku gak suka rasa...")
                    .font(.title3)
                    .fontWeight(.semibold)
                HStack {
                    PersonalizationTag("Manis", emoji: "🍦", isSelected: viewModel.personalizations.contains(getPersonalizationType(personalization: PersonalizationType.manis)), action:  {viewModel.updatePersonalizations(personalization: getPersonalizationType(personalization: PersonalizationType.manis))})
                    
                    PersonalizationTag("Asin", emoji: "🧂", isSelected: viewModel.personalizations.contains(getPersonalizationType(personalization: PersonalizationType.asin)), action:  {viewModel.updatePersonalizations(personalization: getPersonalizationType(personalization: PersonalizationType.asin))})
                    
                    PersonalizationTag("Pedas", emoji: "🌶️", isSelected: viewModel.personalizations.contains(getPersonalizationType(personalization: PersonalizationType.pedas)), action:  {viewModel.updatePersonalizations(personalization: getPersonalizationType(personalization: PersonalizationType.pedas))})
                    
                }
            }
            .padding(.vertical, 12)
            
            //MARK: Section 2
            VStack(alignment: .leading, spacing: 14) {
                Text("Jangan pake karbo dari...")
                    .font(.title3)
                    .fontWeight(.semibold)
                HStack {
                    PersonalizationTag("Nasi", emoji: "🍚", isSelected: viewModel.personalizations.contains(getPersonalizationType(personalization: PersonalizationType.nasi)), action:  {viewModel.updatePersonalizations(personalization: getPersonalizationType(personalization: PersonalizationType.nasi))})
                    
                    PersonalizationTag("Roti", emoji: "🍞", isSelected: viewModel.personalizations.contains(getPersonalizationType(personalization: PersonalizationType.roti)), action:  {viewModel.updatePersonalizations(personalization: getPersonalizationType(personalization: PersonalizationType.roti))})
                    
                    PersonalizationTag("Indomie", emoji: "🍜", isSelected: viewModel.personalizations.contains(getPersonalizationType(personalization: PersonalizationType.indomie)), action:  {viewModel.updatePersonalizations(personalization: getPersonalizationType(personalization: PersonalizationType.indomie))})
                }
            }
            .padding(.vertical, 12)
            
            //MARK: Section 3
            VStack(alignment: .leading, spacing: 14) {
                Text("Aku ga suka di menunya ada...")
                    .font(.title3)
                    .fontWeight(.semibold)
                HStack {
                    PersonalizationTag("Laktosa", emoji: "🥛", isSelected: viewModel.personalizations.contains(getPersonalizationType(personalization: PersonalizationType.laktosa)), action:  {viewModel.updatePersonalizations(personalization: getPersonalizationType(personalization: PersonalizationType.laktosa))})
                    
                    PersonalizationTag("Seafood", emoji: "🐟", isSelected: viewModel.personalizations.contains(getPersonalizationType(personalization: PersonalizationType.seafood)), action:  {viewModel.updatePersonalizations(personalization: getPersonalizationType(personalization: PersonalizationType.seafood))})
                    
                    PersonalizationTag("Kacang", emoji: "🥜", isSelected: viewModel.personalizations.contains(getPersonalizationType(personalization: PersonalizationType.kacang)), action:  {viewModel.updatePersonalizations(personalization: getPersonalizationType(personalization: PersonalizationType.kacang))})
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
