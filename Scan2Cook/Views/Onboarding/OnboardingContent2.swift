//
//  OnboardingContent2.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 27/06/23.
//

import SwiftUI

struct OnboardingContent2: View {
    @State var runAnimation = false
    @Binding var pageIndex: Int
    
    var animation: Animation {
        Animation.easeOut(duration: 1)
    }
    
    var body: some View {
        ZStack {
            Circle()
                .fill(.gray)
                .frame(width: 439, height: 439)
                .transition(.move(edge: .bottom))
                .offset(x: runAnimation ? UIScreen.main.bounds.width - 300 : UIScreen.main.bounds.width + 63,  y: -140)
                .animation(animation)
            
            Image("bowl-of-noodles")
                .frame(width: 400, height: 400)
                .transition(.move(edge: .bottom))
                .rotationEffect(.degrees(runAnimation ? 360 : 180), anchor: .center)
                .offset(x: runAnimation ? UIScreen.main.bounds.width - 570 : -650,  y: -40)
                .animation(animation.delay(0.2))
            
            
            VStack {
                Spacer()
                
                Text("Kita bisa bantu kamu manfaatin bahan yang kamu punya, dengan scan bahan makanan yang ada")
                    .padding(.vertical, 24)
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .opacity(runAnimation ? 1 : 0)
                    .animation(animation.delay(1))
                
                CupertinoButton("Lanjut", action: {
                    pageIndex = pageIndex + 1
                    print(pageIndex)
                })
                    .opacity(runAnimation ? 1 : 0)
                    .animation(animation.delay(2))
            }
            .padding(.vertical, 14)
            .padding(.horizontal, 40)
            
        }
        .onAppear {
            runAnimation.toggle()
        }
        
    }
}

struct OnboardingContent2_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingContent2(pageIndex: .constant(2))
    }
}
