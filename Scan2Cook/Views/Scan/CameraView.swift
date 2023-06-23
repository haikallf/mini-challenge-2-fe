//
//  CameraView.swift
//  Scan2Cook
//
//  Created by Haikal Lazuardi Fadil on 23/06/23.
//

import SwiftUI

struct CameraView: View {
    @EnvironmentObject var scanViewModel: ScanViewModel
    
    var body: some View {
        NavigationLink(destination: ScanResultView().environmentObject(scanViewModel)) {
            Text("Check Result")
        }
        .onAppear {
            scanViewModel.resetIngredientsSelection()
        }
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView().environmentObject(ScanViewModel())
    }
}
