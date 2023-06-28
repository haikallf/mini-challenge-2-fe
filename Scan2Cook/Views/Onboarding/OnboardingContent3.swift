//
//  OnboardingContent3.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 27/06/23.
//

import SwiftUI

struct OnboardingContent3: View {
    @StateObject var viewModel = PersonalizationViewModel()
    @State private var shouldNavigate: Bool = false
    @State var runAnimation = false
    @State var fullName = ""
    @Binding var pageIndex: Int
    
    @State var isAnimationRun: Bool = false
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var animation: Animation {
        Animation.easeOut(duration: 1)
    }
    
    var body: some View {
        ZStack {
            Circle()
                .fill(.gray)
                .frame(width: 439, height: 439)
                .transition(.move(edge: .bottom))
                .offset(x: runAnimation ? UIScreen.main.bounds.width - 260 : UIScreen.main.bounds.width + 63,  y: runAnimation ? -380 : -UIScreen.main.bounds.height)
                .animation(animation)
            
            VStack {
                Text("Sebelum lanjut, apa nama panggilan kamu?")
                    
                    .multilineTextAlignment(.center)
                    .opacity(runAnimation ? 1 : 0)
                    .animation(animation.delay(1))
                
                TextField("", text: $viewModel.username)
                    .padding(.bottom, 8)
                    .fontWeight(.bold)
                    .textFieldStyle(.plain)
                    .multilineTextAlignment(.center)
                    .overlay(
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.gray)
                            .opacity(runAnimation ? 1 : 0)
                            .animation(animation.delay(1)),
                       alignment: .bottom
                    )
                    .opacity(runAnimation ? 1 : 0)
                    .animation(animation.delay(1))
                
//                Divider()
//                    .opacity(runAnimation ? 1 : 0)
//                    .animation(animation.delay(1))
            }
            .font(.title)
            .padding(.horizontal, 40)
            
            
            VStack {
                Spacer()
                
                CupertinoButton("Simpan", action: {
                    viewModel.setUsername()
                    shouldNavigate = true
                }, isDisabled: viewModel.username == "")
                    .opacity(runAnimation ? 1 : 0)
                    .animation(isAnimationRun ? Animation.linear(duration: 0) : animation.delay(2))
                    .onReceive(timer) { time in
                        isAnimationRun = true
                        timer.upstream.connect().cancel()
                    }
            }
            .padding(.vertical, 14)
            .padding(.horizontal, 40)
            
            NavigationLink(destination: OnboardingPersonalizationView(), isActive: $shouldNavigate) {
                EmptyView()
            }
            .opacity(0)
            
        }
        .onAppear {
            runAnimation.toggle()
        }
        
    }
}

struct OnboardingContent3_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingContent3(pageIndex: .constant(2))
    }
}
