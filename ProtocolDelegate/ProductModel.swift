//
//  ProductModel.swift
//  ProtocolDelegate
//
//  Created by Shreya Naik on 13/07/23.
//

import Foundation


protocol VendorActions{
    func getHeartRateDetails() -> Int
    func getSpO2Details() -> Int
    func getSleepDetails() -> Int
    func getTempDetails() -> Int
    func getStepDetails() -> Int
    func getVendorDetails() -> String
}
class Linwear: VendorActions{
    func getHeartRateDetails() -> Int {
        return 80
    }
    
    func getSpO2Details() -> Int {
        return 96
    }
    
    func getSleepDetails() -> Int {
        return 75
    }
    
    func getTempDetails() -> Int {
        return 26
    }
    
    func getStepDetails() -> Int {
        return 5000
    }
    func getVendorDetails() -> String{
        return "Linwear"
    }
    
    
}
class Ido: VendorActions{
    func getHeartRateDetails() -> Int {
        return 72
    }
    
    func getSpO2Details() -> Int {
        return 98
    }
    
    func getSleepDetails() -> Int {
        return 50
    }
    
    func getTempDetails() -> Int {
        return 30
    }
    
    func getStepDetails() -> Int {
        return 7000
    }
    func getVendorDetails() -> String{
        return "Ido"
    }
    
    
    
}
class Yawell: VendorActions{
    func getHeartRateDetails() -> Int {
        return 65
    }
    
    func getSpO2Details() -> Int {
        return 100
    }
    
    func getSleepDetails() -> Int {
        return 70
    }
    
    func getTempDetails() -> Int {
        return 16
    }
    
    func getStepDetails() -> Int {
        return 3000
    }
    func getVendorDetails() -> String{
        return "Yawell"
    }
    
    
    
}
