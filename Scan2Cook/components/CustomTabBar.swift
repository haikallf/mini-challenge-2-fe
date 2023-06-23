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
        HStack(spacing: 32) {
            VStack(spacing: 4) {
                Image(systemName: "house.fill")
                    .resizable()
                    .frame(width: 25, height: 22)
                    .foregroundColor(globalStates.selectedPageIndex == 1 ? .black : Color("labelsSecondary"))
                
                if (globalStates.selectedPageIndex == 1) {
                    Circle()
                        .fill()
                        .frame(width: 6)
                }
            }
            .onTapGesture {
                globalStates.setSelectedPageIndex(value: 1)
            }
            
            VStack(spacing: 4) {
                Image(systemName: "camera.metering.multispot")
                    .resizable()
                    .frame(width: 25, height: 22)
                    .foregroundColor(globalStates.selectedPageIndex == 2 ? .black : Color("labelsSecondary"))
                
                if (globalStates.selectedPageIndex == 2) {
                    Circle()
                        .fill()
                        .frame(width: 6)
                }
            }
            .onTapGesture {
                globalStates.setSelectedPageIndex(value: 2)
            }
            
            VStack(spacing: 4) {
                Image(systemName: "books.vertical")
                    .resizable()
                    .frame(width: 25, height: 22)
                    .foregroundColor(globalStates.selectedPageIndex == 3 ? .black : Color("labelsSecondary"))
                
                if (globalStates.selectedPageIndex == 3) {
                    Circle()
                        .fill()
                        .frame(width: 6)
                }
            }
            .onTapGesture {
                globalStates.setSelectedPageIndex(value: 3)
            }
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 24)
        .background(Color("gray5"))
        .cornerRadius(120)
        .padding(.bottom)
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar()
            .environmentObject(GlobalStates())
    }
}
