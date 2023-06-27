//
//  CustomSearchBar.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 24/06/23.
//

import SwiftUI

struct CustomSearchBar: View {
    let placeholder: String
    @Binding var searchText: String
    
    var body: some View {
        //MARK: SearchBar
        HStack(spacing: 8) {
            Image(systemName: "magnifyingglass")
                .foregroundColor(Color("labelsSecondary"))
            TextField(placeholder, text: $searchText)
        }
        .padding(8)
        .background(Color("fillsPrimary"))
        .cornerRadius(8)
        .padding(.vertical, 12)
    }
}

struct CustomSearchBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomSearchBar(placeholder: "halo", searchText: .constant("haha"))
    }
}
