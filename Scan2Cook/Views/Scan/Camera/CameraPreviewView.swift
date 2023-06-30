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
    @State var cameraPreviewNavigation : CameraPreviewNavigation?
    @State var cameraCaptured = false
    var body: some View {
        NavigationStack{
            ZStack{
                Color("black100")
                    .ignoresSafeArea()
                VStack{
                    ZStack{
                        CameraPreview(camera: cameraModel)
                            .ignoresSafeArea()
                            .cornerRadius(24)
                        if !cameraCaptured {
                            VStack{
                                Image(systemName: "carrot")
                                    .foregroundColor(.white)
                                    .font(.system(size: 48))
                                Text("Pastikan kamu memperlihatkan dengan jelas bahan yang dimiliki")
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                    .frame(width: 329)
                            }
                        }
                        if cameraModel.cameraState == .photoTaken{
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.white)
                                .font(.system(size: 48))
                        }
                    }
                    VStack{
                        // MARK: Camera Initialized
                         if cameraModel.cameraState == .cameraInitialized {
                             ZStack{
                                 VStack{
                                     Button {
                                         cameraPreviewNavigation = .education
                                         navigateNextView.toggle()
                                     } label: {
                                         Text("Gimana cara pakenya sii?")
                                             .foregroundColor(Color.white)
                                     }

                                     Button {
                                         withAnimation {
                                             cameraCaptured = true
                                         }
                                         cameraModel.takePicture()
                                     } label: {
                                         ZStack{
                                             Circle()
                                                 .fill(Color.white)
                                                 .frame(width: 80, height: 80)
                                             Circle()
                                                 .stroke(Color.white, lineWidth: 4)
                                                 .frame(width: 96, height: 96)
                                         }
                                     }

                                 }.frame(height: 180)
                             }
                        } else if cameraModel.cameraState == .photoTaken {
                            // MARK: Photo Taken
                            VStack{
                                Spacer()
                                Button(action: cameraModel.retakePicture) {
                                    Text("Memproses")
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.trailing)
                                        .font(.body)
                                }
                            }.frame(height: 180)
                        } else {
                            // MARK: Objects Detected
                            HStack{
                                Spacer()
                                Button {
                                    cameraModel.objectsDetected = nil
                                    cameraModel.retakePicture()
                                } label: {
                                    Image(systemName: "arrow.uturn.left.circle.fill")
                                        .foregroundColor(.white)
                                        .font(.system(size: 56))
                                }
                                Spacer()
                                VStack{
                                    Text("\(cameraModel.identifiedIngredients.count)")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    Text("Bahan Ditemukan")
                                        .font(.body)
                                        .foregroundColor(.white)
                                }
                                Spacer()
                                Button {
                                    scanViewModel.setSelectedIngredients(ingredients: cameraModel.identifiedIngredients)
                                    scanViewModel.setImage(image: cameraModel.processedImage)
                                    cameraPreviewNavigation = .scanResult
                                    navigateNextView.toggle()
                                } label: {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(Color.white)
                                        .font(.system(size: 56))
                                }
                                Spacer()

                            }.frame(height: 180)
                        }
                    }
                }
            }
            
            .onAppear {
                cameraModel.checkPermission()
            }
            .navigationDestination(isPresented: $navigateNextView) {
                if cameraPreviewNavigation == .education {
                    EducationView()
                }else {
                    ScanResultView()
                        .environmentObject(scanViewModel)
                }

            }

        }.navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: backButton())
        .modifier(HideBackButtonModifier())
    }
}

struct CameraPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        CameraPreviewView(cameraModel: CameraModel())
            .environmentObject(ScanViewModel())
    }
}

enum CameraPreviewNavigation{
    case scanResult
    case education
}

struct HideBackButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: EmptyView()) // Clear the leading items
    }
}

private func backButton() -> some View {
    HStack {
        BackButton(color: .white)
            .offset(x: -20)
        Spacer()
    }
}
