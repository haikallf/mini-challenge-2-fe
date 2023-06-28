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
    
    init(color: Color = .black){
        self.color = color
    }
    var body: some View {
        HStack {
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "arrow.left")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(color)
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
