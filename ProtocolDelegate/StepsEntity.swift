//
//  StepsEntity.swift
//  ProtocolDelegate
//
//  Created by Shreya Naik on 28/07/23.
//

import Foundation
import RealmSwift

class StepsItem:Object{
    @objc dynamic var steps:Int = 0
    @objc dynamic var time:TimeInterval = 0
    
}

class StepsEntity:Object{
    @objc dynamic var index = "0089"
    @objc dynamic var date = Date()
    var details = List<StepsItem>()
    override class func primaryKey() -> String? {
        "index"
    }
    
    static func storeStepsData(_ data : StepsModel) {
        let realmObject = DatabaseManager.sharedInstance.realmObject
        if !realmObject.isInWriteTransaction {
            realmObject.beginWrite()
        }
        let stepEntity = StepsEntity()
        stepEntity.index = "0089"
        stepEntity.date = data.date
        data.stepsDetails.forEach { item in
            let stepsItem = StepsItem()
            stepsItem.steps = item.steps
            stepsItem.time = item.time
            stepEntity.details.append(stepsItem)
        }
        realmObject.add(stepEntity, update: .all)
        do {
            try realmObject.commitWrite()
        } catch {
            print(error)
        }
        
        
    }
    
}
