//
//  CameraView.swift
//  Scan2Cook
//
//  Created by Kevin Dallian on 23/06/23.
//

import SwiftUI

struct CameraPreviewView: View {
    @StateObject var cameraModel = CameraModel()
    @EnvironmentObject var scanViewModel : ScanViewModel
    @State var navigateNextView : Bool = false
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
                                HStack{
                                    Button(action: cameraModel.retakePicture) {
                                        Image(systemName: "arrowshape.turn.up.backward.circle.fill")
                                            .font(.title)
                                    }
                                    VStack{
                                        Text("\(cameraModel.objectsDetected.count)")
                                        Text("Bahan Ditemukan")
                                    }
                                    Button {
                                        navigateNextView = true
                                    } label: {
                                        Image(systemName: "checkmark.circle.fill")
                                            .font(.title)
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
            .onDisappear(perform: {
                scanViewModel.setSelectedIngredients(arr: cameraModel.objectsDetected)
//                print("\(cameraModel.objectsDetected)")
            })
            
            .navigationDestination(isPresented: $navigateNextView) {
                ScanResultView(image: cameraModel.processedImage ?? UIImage())
                    .environmentObject(scanViewModel)
            }
        }
    }
    
    struct CameraPreviewView_Previews: PreviewProvider {
        static var previews: some View {
            CameraPreviewView(cameraModel: CameraModel())
        }
    }
    
    
}
