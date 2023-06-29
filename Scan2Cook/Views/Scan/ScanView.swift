//
//  ScanView.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 23/06/23.
//

import SwiftUI

struct ScanView: View {
    @EnvironmentObject var globalStates: GlobalStates
    @StateObject var scanViewModel = ScanViewModel()
    @State private var settingsDetent = PresentationDetent.height(140)
    @State private var showSheet = false
    @State var isLoading: Bool = false
    @State var shouldNavigate = false
    
    var body: some View {
        VStack {
            ZStack {
                NavigationLink(destination: CameraPreviewView()
                    .environmentObject(scanViewModel), isActive: $shouldNavigate) {
                    EmptyView()
                }
                    .opacity(0)
                
                if (isLoading) {
                    Button(action: {}, label: {
                        VStack(spacing: 0) {
                            Text("Loading...")
                                .font(.title2)
                                .fontWeight(.bold)
                        }
                        .foregroundColor(.black)
                    })
                } else {
                    Button(action: {
                        isLoading.toggle()
                        print(isLoading)
                        shouldNavigate = true
                    }, label: {
                        VStack(spacing: 4) {
                            Text("Cari apa hari ini?")
                                .font(CustomFont.title5)
                                .fontWeight(.bold)
                            
                            Text("Tap untuk melakukan scanning")
                                .font(CustomFont.body)
                                .padding(.bottom, 24)
                            
                            Image("scan-camera")
                        }
                        .foregroundColor(.black)
                    })
                }
                
                
                VStack {
                    Spacer()
                    NavigationLink(destination: EducationView(), label: {
                        HStack(spacing: 4) {
                            Image(systemName: "questionmark.circle")
                            Text("Bagaimana caranya ini bekerja?")
                        }
                        .font(CustomFont.caption)
                        .foregroundColor(.black)
                        .padding(.vertical, 24)
                    })
                }
            }
            .frame(width: 393, height: 619)
            .background(Colors.surfaceContainer)
            
            //MARK: Last Seen Section
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Terakhir Di-scan")
                            .font(CustomFont.headline)
                            .fontWeight(.semibold)
                        
                        Text("\(scanViewModel.lastSeenRecipes.count) Resep")
                            .font(CustomFont.caption)
                    }
                    .foregroundColor(Colors.AAA)
                    
                    Spacer()
                    
                    Button(action: {
                        showSheet = true
                        settingsDetent = PresentationDetent.large
                    }, label: {
                        HStack {
                            Text("Lihat")
                                .font(CustomFont.subheadline)
                            
                            Image(systemName: "arrow.up")
                                .font(.caption)
                        }
                        .padding(.vertical, 7)
                        .padding(.horizontal, 14)
                        .foregroundColor(Colors.AAA)
                        .cornerRadius(40)
                        .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Colors.border1, lineWidth: 1)
                        )
                    })
                }
                
                Spacer()
            }
            .padding(.top, 28)
            .padding(.horizontal)
            
            Spacer()
        }
        .onDisappear(perform: {
            isLoading = false
        })
        .navigationBarBackButtonHidden(true)
        .sheet(isPresented: $showSheet) {
            NavigationView {
                VStack() {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Terakhir Dilihat")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .padding(.top)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, 12)
                    .padding(.horizontal)
                    
                    RecipeLists(recipes: scanViewModel.lastSeenRecipes)
                }
            }
        }
            .presentationDragIndicator(.visible)
            .padding(.horizontal)
    }
}


struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        ScanView()
    }
}
