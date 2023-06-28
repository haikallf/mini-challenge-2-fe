//
//  FilterTag.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi on 27/06/23.
//

import SwiftUI

struct FilterTag: View {
    var text: String
    var isSelected: Bool
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap, label: {
            Text(text)
                .font(CustomFont.subheadline)
                .padding(10)
                .background(isSelected ? Colors.primaryContainer : .white.opacity(0))
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(isSelected ? Colors.primaryContainer : Colors.border1, lineWidth: 1)
                )
        })
    }
}

struct FilterTag_Previews: PreviewProvider {
    static var previews: some View {
        FilterTag(text: "<2 alat", isSelected: true, onTap: {})
    }
}
