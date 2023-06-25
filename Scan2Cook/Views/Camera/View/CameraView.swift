//
//  CameraView.swift
//  Scan2Cook
//
//  Created by Kevin Dallian on 23/06/23.
//

import SwiftUI

struct CameraView: View {
    @StateObject var cameraModel = CameraModel()
    var body: some View {
        ZStack{
            CameraPreview(camera: cameraModel)
                .ignoresSafeArea()
            VStack{
                Spacer()
                HStack{
                    if cameraModel.isTaken {
                        Button(action: cameraModel.retakePicture) {
                            Text("Done")
                                .multilineTextAlignment(.trailing)
                        }
                    } else{
                        Button(action: cameraModel.takePicture) {
                            ZStack{
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 80, height: 80)
                                Circle()
                                    .stroke(Color.white, lineWidth: 4)
                                    .frame(width: 96, height: 96)
                            }
                        }
                    }
                    
                }
            }
        }
        .onAppear {
            cameraModel.checkPermission()
        }
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}
