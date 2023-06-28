//
//  CupertinoButton.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 21/06/23.
//

import SwiftUI

struct CupertinoButton: View {
    let text: String
    let onTap: () -> Void
    var isDisabled: Bool
    var foregroundColor: Color
    var backgroundColor: Color
    
    init(_ text: String, action: @escaping () -> Void, isDisabled: Bool = false, foregroundColor: Color = Colors.onPrimary, backgroundColor: Color = Colors.secondary) {
        self.text = text
        self.onTap = action
        self.isDisabled = isDisabled
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
    }
    
    var body: some View {
        Button(action: onTap) {
            Text(text)
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundColor(isDisabled ? Color("labelsTertiary") : foregroundColor )
                .background(isDisabled ? Color("fillsTertiary") : backgroundColor)
                .foregroundColor(.white)
                .cornerRadius(12)
        }
        .disabled(isDisabled)
    }
}

struct CupertinoButton_Previews: PreviewProvider {
    static var previews: some View {
        CupertinoButton("Halo", action: {})
    }
}
