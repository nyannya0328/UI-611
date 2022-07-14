//
//  MortionManeger.swift
//  UI-611
//
//  Created by nyannyan0328 on 2022/07/14.
//

import SwiftUI
import CoreMotion

class MortionManeger: ObservableObject {
    @Published var maneger : CMMotionManager = .init()
    @Published var xValue : CGFloat = 0
    @Published var currentSlider : Place = sample_places.first!
    
    func detectMoriton(){
        
        if !maneger.isDeviceMotionActive{
            
            maneger.deviceMotionUpdateInterval = 1/50
            maneger.startDeviceMotionUpdates(to: .main) {[weak self] motion, err in
                
                if let attitude = motion?.attitude{
                    
                    self?.xValue = attitude.roll
                    
                }
            }
        }
        
    }
    
    func stop(){
        
        maneger.stopDeviceMotionUpdates()
    }
}

