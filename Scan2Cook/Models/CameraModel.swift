//
//  CameraModel.swift
//  Scan2Cook
//
//  Created by Kevin Dallian on 23/06/23.
//

import AVFoundation
import Foundation
import SwiftUI
import Vision

enum CameraState{
    case cameraInitialized
    case photoTaken
    case objectDetected
}

class CameraModel : NSObject, ObservableObject, AVCapturePhotoCaptureDelegate {
    @Published var cameraState : CameraState = .cameraInitialized
    @Published var session = AVCaptureSession()
    @Published var output = AVCapturePhotoOutput()
    @Published var previewLayer : AVCaptureVideoPreviewLayer?
    @Published var objectsDetected : [VNClassificationObservation]?
    @Published var processedImage : UIImage = UIImage()
    @Published var identifiedIngredients : [Ingredient] = []
    private var mlManager = MLManager()
    private var showAlert = false
    
    init(isTaken : CameraState = .cameraInitialized){
        self.cameraState = isTaken
    }
    
    // MARK: Permissions
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
        // show alert on view (update later)
        case .restricted:
            self.showAlert = true
        // show alert on view (update later)
        case .denied:
            self.showAlert = true
        @unknown default:
            return
        }
    }
    // MARK: Camera Setup
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
    
    // MARK: Picture State
    func takePicture(){
        DispatchQueue.global(qos: .background).async {
            let settings = AVCapturePhotoSettings()
            self.output.capturePhoto(with: settings, delegate: self)
            
            //Wait for capturePhoto to finish
            DispatchQueue.main.async {
                Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { (timer) in
                    self.session.stopRunning()
                }
            }
            
            DispatchQueue.main.async {
                withAnimation {
                    self.cameraState = .photoTaken
                }
            }
        }
        
    }
    
    func retakePicture(){
        DispatchQueue.global(qos: .background).async {
            self.session.startRunning()
            DispatchQueue.main.async {
                withAnimation {
                    self.cameraState = .cameraInitialized
                }
            }
        }
    }
     
    // MARK: Photo Output
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
    
        let resizedImage = resizeImage(image, targetSize: CGSize(width: 1000, height: 1000))!
        processedImage = resizedImage
    
        objectsDetected = mlManager.detectObjects(in: resizedImage)
        self.cameraState = .objectDetected
        identifiedIngredients = identifyIngredients(objectsDetected: objectsDetected!)
    }
    
    // MARK: Resize Image
    func resizeImage(_ image: UIImage, targetSize: CGSize) -> UIImage? {
        let size = image.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height

        let scaleFactor = min(widthRatio, heightRatio)
        let newSize = CGSize(width: size.width * scaleFactor, height: size.height * scaleFactor)

        let renderer = UIGraphicsImageRenderer(size: newSize)
        let resizedImage = renderer.image { _ in
            image.draw(in: CGRect(origin: .zero, size: newSize))
        }
        
        return resizedImage
    }
    
    // MARK: Identify Ingredients
    func identifyIngredients(objectsDetected : [VNClassificationObservation]) -> [Ingredient]{
        let ingredients = Ingredient.all
        var ingredientsFound : [Ingredient] = []
        for obj in objectsDetected{
            if let ingredientFound = ingredients.first(where: { ingredient in
                ingredient.attribute == obj.identifier
            }){
                if !ingredientsFound.contains(ingredientFound){
                    ingredientsFound.append(ingredientFound)
                    print("Ingredients Appended \(ingredientFound.name)")
                }
            }
        }
        return ingredientsFound
    }
}
