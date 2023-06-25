//
//  DotIndicator.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi on 25/06/23.
//

import SwiftUI

struct DotIndicator: View {
    @Binding var currentIndex: Int
    let maxIndex: Int
    
    var body: some View {
        HStack(spacing: maxIndex <= 7 ? 16 : 10) {
            ForEach((1...maxIndex), id: \.self) { idx in
                Circle()
                    .fill(idx == currentIndex ? .black : .gray)
                    .frame(width: idx == currentIndex ? 14 : 10)
                    .onTapGesture {
                        currentIndex = idx
                    }
            }
        }
        .frame(maxWidth: .infinity)
        
    }
}

struct DotIndicator_Previews: PreviewProvider {
    static var previews: some View {
        DotIndicator(currentIndex: .constant(1), maxIndex: 9)
    }
}
