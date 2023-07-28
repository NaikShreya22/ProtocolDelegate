//
//  HRStructure.swift
//  ProtocolDelegate
//
//  Created by Shreya Naik on 28/07/23.
//

import Foundation

//HR entity structure
public struct HRModelData {
    public var date:Date!
    public var hrDetails = [HRDetails]()
    public init () { }
}
public struct HRDetails {
    var heartRate:Int = 0
    var time:TimeInterval = 0
}

//steps entity Structure
public struct StepsModel{
    public var date:Date!
    public var stepsDetails = [StepsDetails]()
    public init () {
        
    }
}
public struct StepsDetails{
    var steps:Int = 0
    var time:TimeInterval = 0
}



extension Date {
    var midNight: Date {
        return Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: self)!
    }
}
