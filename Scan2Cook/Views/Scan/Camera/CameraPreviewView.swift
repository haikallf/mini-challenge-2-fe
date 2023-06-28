//
//  CameraView.swift
//  Scan2Cook
//
//  Created by Kevin Dallian on 23/06/23.
//

import SwiftUI

struct CameraPreviewView: View {
    @EnvironmentObject var scanViewModel : ScanViewModel
    @StateObject var cameraModel = CameraModel()
    @State var navigateNextView = false
    var body: some View {
        NavigationStack{
            ZStack{
                CameraPreview(camera: cameraModel)
                    .ignoresSafeArea()
                VStack{
                    ZStack{
                        VStack{
                            Spacer()
                             if cameraModel.cameraState == .cameraInitialized {
                                 VStack{
                                     Button(action: {}) {
                                         Text("Gimana cara pakenya sii?")
                                             .foregroundColor(Color.white)
                                     }
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
                            } else if cameraModel.cameraState == .photoTaken {
                                Button(action: cameraModel.retakePicture) {
                                    Text("Done")
                                        .multilineTextAlignment(.trailing)
                                }
                            } else {
                                //MARK: Photo Captured buttons
                                HStack{
                                    Button {
                                        cameraModel.objectsDetected = nil
                                        cameraModel.retakePicture()
                                    } label: {
                                        Image(systemName: "arrowshape.turn.up.backward.circle.fill")
                                            .foregroundColor(Color("fillsPrimary"))
                                            .font(.title)
                                    }

                                    VStack{
                                        Text("\(cameraModel.identifiedIngredients.count)")
                                        Text("Bahan Ditemukan")
                                    }
                                    Button {
                                        scanViewModel.setSelectedIngredients(ingredients: cameraModel.identifiedIngredients)
                                        scanViewModel.setImage(image: cameraModel.processedImage)
                                        navigateNextView.toggle()
                                    } label: {
                                        Image(systemName: "checkmark.circle.fill")
                                            .foregroundColor(Color("fillsPrimary"))
                                            .font(.title)
                                    }

                                }
                            }
                        }
                    }
                }
            }
            .onAppear {
                cameraModel.checkPermission()
            }
            .navigationDestination(isPresented: $navigateNextView) {
                ScanResultView()
                    .environmentObject(scanViewModel)
            }
        }
    }
}

struct CameraPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        CameraPreviewView(cameraModel: CameraModel())
            .environmentObject(ScanViewModel())
    }
}
