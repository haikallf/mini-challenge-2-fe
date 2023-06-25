//
//  PillIndicator.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi on 25/06/23.
//

import SwiftUI

struct PillIndicator: View {
    @Binding var currentIndex: Int
    let maxIndex: Int
    
    var body: some View {
        HStack(spacing: maxIndex <= 7 ? 16 : 10) {
            ForEach((1...maxIndex), id: \.self) { idx in
                if (idx == currentIndex) {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.black)
                        .frame(width: 20, height: 10)
                        .onTapGesture {
                            currentIndex = idx
                        }
                        
                } else {
                    Circle()
                        .fill(.gray)
                        .frame(width: 10)
                        .onTapGesture {
                            currentIndex = idx
                        }
                        .animation(.easeInOut, value: currentIndex)
                }
            }
        }
        
    }
}

struct PillIndicator_Previews: PreviewProvider {
    static var previews: some View {
        PillIndicator(currentIndex: .constant(1), maxIndex: 9)
    }
}
