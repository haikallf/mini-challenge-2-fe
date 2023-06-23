//
//  MainView.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 23/06/23.
//

import SwiftUI

struct MainView: View {
    @State private var selectedItem = 1
    @StateObject var globalStates: GlobalStates = GlobalStates()
    
    var body: some View {
//        TabView {
//            HomeView()
//                .tabItem() {
//                    Image(systemName: "house")
//                    Image(systemName: "circle.fill")
//                }
//                .tag(1)
//
//            ScanView()
//                .tabItem() {
//                    Image(systemName: "house")
//                }
//                .tag(2)
//
//            BookmarkView()
//                .tabItem() {
//                    Image(systemName: "house")
//                }
//                .tag(3)
//        }
//        .accentColor(.black)
//        .navigationBarBackButtonHidden(true)
        
        ZStack {
            if globalStates.selectedPageIndex == 1 {
                HomeView()
            } else if globalStates.selectedPageIndex == 2 {
                ScanView()
                    .environmentObject(globalStates)
            } else if globalStates.selectedPageIndex == 3 {
                BookmarkView()
            }
            
            VStack {
                Spacer()
                CustomTabBar()
                    .environmentObject(globalStates)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
