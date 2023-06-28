//
//  OnboardingContent1.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 27/06/23.
//

import SwiftUI

struct OnboardingContent1: View {
    @State var runAnimation = false
    @Binding var pageIndex: Int
    
    var animation: Animation {
        Animation.easeInOut(duration: 1)
    }
    
    var body: some View {
        ZStack {
            VStack {
                Circle()
                    .fill(Colors.onPrimaryContainer)
                    .offset(x: 90)
                    .frame(width: 439, height: 439)
            }
            VStack {
                Text("Masak Ga Ribet?")
                    .font(CustomFont.epilogue(size: 34))
                
                Text("Gampang Banget")
                    .font(CustomFont.epilogue(size: 34))
                    .fontWeight(.bold)
                
                Spacer()
            }
            .foregroundColor(Colors.AAA)
            .padding(.vertical, 32)
            .opacity(runAnimation ? 1 : 0)
            .animation(animation)
            
            Image("chives")
                .transition(.move(edge: .bottom))
                .offset(x: UIScreen.main.bounds.width - 300,  y: runAnimation ? -140 : UIScreen.main.bounds.height)
                .animation(animation.delay(1))
            
            Image("carrot")
                .transition(.move(edge: .bottom))
                .offset(x: UIScreen.main.bounds.width - 450,  y: runAnimation ? -40 : UIScreen.main.bounds.height)
                .animation(animation.delay(2))
            
            Image("egg")
                .transition(.move(edge: .bottom))
                .offset(x: UIScreen.main.bounds.width - 300,  y: runAnimation ? 80 : UIScreen.main.bounds.height)
                .animation(animation.delay(3))
            
            Image("instant-noodles")
                .transition(.move(edge: .bottom))
                .offset(x: UIScreen.main.bounds.width - 490,  y: runAnimation ? 255 : UIScreen.main.bounds.height)
                .animation(animation.delay(4))

            
            VStack {
                Spacer()
                
                CupertinoButton("Lanjut", action: {
                    pageIndex = pageIndex + 1
                    print(pageIndex)
                });
            }
            .padding(.vertical, 14)
            .padding(.horizontal, 60)
            .opacity(runAnimation ? 1 : 0)
            .animation(animation.delay(5))
        }
        .onAppear{
            runAnimation.toggle()
        }
        
    }
}

struct OnboardingContent1_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingContent1(pageIndex: .constant(1))
    }
}
