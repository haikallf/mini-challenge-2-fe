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
    
    init(_ text: String, action: @escaping () -> Void, isDisabled: Bool = false) {
        self.text = text
        self.onTap = action
        self.isDisabled = isDisabled
    }
    
    var body: some View {
        Button(action: onTap) {
            Text(text)
                .padding()
                .frame(maxWidth: .infinity)
                .background(isDisabled ? Color("fillsTertiary") : .black)
                .foregroundColor(isDisabled ? Color("labelsTertiary") : .white )
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
