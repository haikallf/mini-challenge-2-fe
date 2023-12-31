//
//  PersonalizationTag.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 21/06/23.
//

import SwiftUI

struct PersonalizationTag: View {
    let text: String
    let emoji: String
    var isSelected: Bool
    let action: () -> Void
    
    init(_ text: String, emoji: String, isSelected: Bool,  action: @escaping () -> Void) {
        self.text = text
        self.emoji = emoji
        self.isSelected = isSelected
        self.action = action
    }
    
    var body: some View {
        HStack {
            Text(emoji)
                .frame(width: 15, height: 20)
            Text(text)
                .foregroundColor(isSelected ? Colors.AAA : Colors.onPrimaryContainer)
        }
        .font(.subheadline)
        .padding(10)
        .background(isSelected ? Colors.primaryContainer : .white.opacity(0))
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(isSelected ? Colors.primaryContainer : Colors.border1, lineWidth: 1)
        )
        .onTapGesture {
            action()
        }
    }
}

struct PersonalizationTag_Previews: PreviewProvider {
    static var previews: some View {
        PersonalizationTag("Manis", emoji: "🍦", isSelected: false, action: {})
    }
}
