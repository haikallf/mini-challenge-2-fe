//
//  MLManager.swift
//  Scan2Cook
//
//  Created by Kevin Dallian on 25/06/23.
//

import CoreML
import UIKit
import Vision
class MLManager {
    private var model : VNCoreMLModel? = nil
    
    init(){
        self.model = loadModel()!
        print("load model success")
    }
    
    func loadModel() -> VNCoreMLModel? {
        guard let modelURL = Bundle.main.url(forResource: "Scan2CookMLModel", withExtension: "mlmodelc") else {
            print("Model file not found")
            return nil
        }
        
        guard let coreMLModel = try? MLModel(contentsOf: modelURL) else {
            print("Failed to create MLModel")
            return nil
        }
        
        guard let visionModel = try? VNCoreMLModel(for: coreMLModel) else {
            print("Failed to create VNCoreMLModel")
            return nil
        }
        
        return visionModel
    }
    
    func detectObjects(in image: UIImage){
        guard let ciImage = CIImage(image: image) else {
            print("Failed to create CIImage from UIImage")
            return
        }
        
        let request = VNCoreMLRequest(model: model!) { request, error in
            guard let results = request.results as? [VNRecognizedObjectObservation] else {
                print("Failed to process the results")
                return
            }
            if results.isEmpty {
                print("Result empty")
            }else {
                for result in results {
//                    let boundingBox = result.boundingBox
//                    let confidence = result.confidence
                    let resultsFiltered = result.labels.filter { label in
                        label.confidence >= 0.8
                    }
                    for className in resultsFiltered{
                        print("Detected \(className.identifier), with confidence \(className.confidence)")
                    }
                }
            }
            
        }
        let handler = VNImageRequestHandler(ciImage: ciImage)
        do {
            try handler.perform([request])
        } catch {
            print("Error performing object detection: \(error.localizedDescription)")
        }
    }
}
