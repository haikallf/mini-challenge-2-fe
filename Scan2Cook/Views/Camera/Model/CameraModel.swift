//
//  CameraModel.swift
//  Scan2Cook
//
//  Created by Kevin Dallian on 23/06/23.
//

import AVFoundation
import Foundation
import SwiftUI

class CameraModel : NSObject, ObservableObject, AVCapturePhotoCaptureDelegate {
    @Published var isTaken = false
    @Published var session = AVCaptureSession()
    private var showAlert = false
    @Published var output = AVCapturePhotoOutput()
    @Published var previewLayer : AVCaptureVideoPreviewLayer?
    private var mlManager = MLManager()
    
    func checkPermission(){
        switch AVCaptureDevice.authorizationStatus(for: .video){
        case .authorized :
            cameraSetup()
        case .notDetermined :
            AVCaptureDevice.requestAccess(for: .video) { status in
                if status {
                    self.cameraSetup()
                }
            }
        case .restricted:
            self.showAlert = true
        case .denied:
            self.showAlert = true
        @unknown default:
            return
        }
    }
    
    func cameraSetup(){
        do{
            self.session.beginConfiguration()
            
            let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back)
            let input = try AVCaptureDeviceInput(device: device!)
            
            // checking session can add input & output
            if self.session.canAddInput(input){
                self.session.addInput(input)
            }
            
            if self.session.canAddOutput(output){
                self.session.addOutput(output)
                print("add output success")
            }
            
            self.session.commitConfiguration()
        }catch{
            print("Error setting camera \(error.localizedDescription)")
        }
    }
    
    func takePicture(){
        DispatchQueue.global(qos: .background).async {
            let settings = AVCapturePhotoSettings()
            self.output.capturePhoto(with: settings, delegate: self)
            
            //Wait for capturePhoto to finish
            DispatchQueue.main.async {
                Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { (timer) in
                    self.session.stopRunning()
                }
            }
            
            DispatchQueue.main.async {
                withAnimation {
                    self.isTaken.toggle()
                }
            }
        }
        
    }
    
    func retakePicture(){
        DispatchQueue.global(qos: .background).async {
            self.session.startRunning()
            
            DispatchQueue.main.async {
                withAnimation {
                    self.isTaken.toggle()
                }
            }
        }
    }
     
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if let error = error {
            print("Error capturing photo: \(error.localizedDescription)")
            return
        }
        
        guard let imageData = photo.fileDataRepresentation() else {
            print("Unable to retrieve photo data")
            return
        }
        
        guard let image = UIImage(data: imageData) else {
            print("Unable to convert UIImage")
            return
        }
        print("Photo taken")
        
        // Process the captured photo data as needed
        // For example, you can save it to a file or display it on the screen
        mlManager.detectObjects(in: image)
    }
}
