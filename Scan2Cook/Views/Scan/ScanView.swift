//
//  ScanView.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 23/06/23.
//

import SwiftUI

struct ScanView: View {
    @StateObject var scanViewModel = ScanViewModel()
    
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
                
                VStack {
                    Spacer()
                    HStack(spacing: 4) {
                        Image(systemName: "questionmark.circle")
                        Text("Bagaimana caranya ini bekerja?")
                    }
                    .font(.caption2)
                    .padding(.vertical, 24)
                }
                
            }
            .frame(width: 393, height: 619)
            .background(Color("fillsPrimary"))
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        ScanView()
    }
}
