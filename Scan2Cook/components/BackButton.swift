//
//  BackButton.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi on 26/06/23.
//

import SwiftUI

struct BackButton: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var color : Color
    var isCircleButton: Bool
    
    init(color: Color = .black, isCircleButton: Bool = false){
        self.color = color
        self.isCircleButton = isCircleButton
    }
    var body: some View {
        HStack {
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                if (isCircleButton) {
                    Image(systemName: "arrow.left")
                        .padding(10)
                        .background(Colors.secondaryContainer)
                        .foregroundColor(Colors.onSecondaryContainer)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .clipShape(Circle())
                        
                } else {
                    Image(systemName: "arrow.left")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(color)
                }
            }
            
            Spacer()
        }
        .padding(.vertical, 12)
        .padding(.horizontal)
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton()
    }
}
