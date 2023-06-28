//
//  CustomTabBar.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 23/06/23.
//

import SwiftUI

struct CustomTabBar: View {
    @EnvironmentObject var globalStates: GlobalStates
    
    var body: some View {
        HStack(spacing: 16) {
            VStack(spacing: 4) {
                Image(systemName: "house.fill")
                    .foregroundColor(globalStates.selectedPageIndex == 1 ? Colors.onTertiaryContainer : Colors.disabled)
                
                if (globalStates.selectedPageIndex == 1) {
                    Circle()
                        .fill(Colors.onTertiaryContainer)
                        .frame(width: 6)
                }
            }
            .frame(width: 49.67)
            .onTapGesture {
                globalStates.setSelectedPageIndex(value: 1)
            }
            
            VStack(spacing: 4) {
                Image(systemName: "camera.metering.multispot")
                    .foregroundColor(globalStates.selectedPageIndex == 2 ? Colors.onTertiaryContainer : Colors.disabled)
                
                if (globalStates.selectedPageIndex == 2) {
                    Circle()
                        .fill(Colors.onTertiaryContainer)
                        .frame(width: 6)
                }
            }
            .frame(width: 49.67)
            .onTapGesture {
                globalStates.setSelectedPageIndex(value: 2)
            }
            
            VStack(spacing: 4) {
                Image(systemName: "books.vertical")
                    .foregroundColor(globalStates.selectedPageIndex == 3 ? Colors.onTertiaryContainer : Colors.disabled)
                
                if (globalStates.selectedPageIndex == 3) {
                    Circle()
                        .fill(Colors.onTertiaryContainer)
                        .frame(width: 6)
                }
            }
            .frame(width: 49.67)
            .onTapGesture {
                globalStates.setSelectedPageIndex(value: 3)
            }
        }
        .frame(height: 32)
        .padding(.vertical, 8)
        .padding(.horizontal, 24)
        .background(Colors.tertiaryContainer)
        .cornerRadius(120)
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar()
            .environmentObject(GlobalStates())
    }
}
