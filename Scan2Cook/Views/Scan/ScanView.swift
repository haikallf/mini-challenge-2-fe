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
    
    var body: some View {
        VStack {
            ZStack {
                NavigationLink(destination: CameraView().environmentObject(scanViewModel)) {
                    VStack(spacing: 0) {
                        Text("Cari apa hari ini?")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text("Tap untuk melakukan scanning")
                            .font(.headline)
                            .fontWeight(.bold)
                            .padding(.bottom, 24)
                        
                        Image("scan-camera")
                    }
                    .foregroundColor(.black)
                }
                .simultaneousGesture(TapGesture().onEnded{
                    showSheet = false
                })
                
                VStack {
                    Spacer()
                    NavigationLink(destination: EducationView(), label: {
                        HStack(spacing: 4) {
                            Image(systemName: "questionmark.circle")
                            Text("Bagaimana caranya ini bekerja?")
                        }
                        .font(.caption2)
                        .foregroundColor(.black)
                        .padding(.vertical, 24)
                    })
                }
            }
            .frame(width: 393, height: 619)
            .background(Color("fillsPrimary"))
            
            //MARK: Last Seen Section
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Terakhir Di-scan")
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        Text("13 Resep")
                            .font(.caption)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        showSheet = true
                        settingsDetent = PresentationDetent.large
                    }, label: {
                        HStack {
                            Text("Lihat")
                                .font(.subheadline)
                            
                            Image(systemName: "arrow.up")
                                .font(.subheadline)
                        }
                        .padding(.vertical, 7)
                        .padding(.horizontal, 14)
                        .background(.black)
                        .foregroundColor(.white)
                        .cornerRadius(40)
                    })
                }
                
                Spacer()
            }
            .padding(.top, 28)
            .padding(.horizontal)
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .sheet(isPresented: $showSheet) {
            Group {
                Text("halo")
                    
               
            }
            .presentationDragIndicator(.visible)
            .padding(.horizontal)
//            .presentationDetents(
//                [.height(140), .large],
//                selection: $settingsDetent
//             )
//            .presentationBackgroundInteraction(
//                .enabled(upThrough: .large)
//            )
//            .interactiveDismissDisabled(true)
        }
    }
}

struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        ScanView()
    }
}
