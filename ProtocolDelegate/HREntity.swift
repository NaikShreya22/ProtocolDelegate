//
//  Watch Data.swift
//  ProtocolDelegate
//
//  Created by Shreya Naik on 18/07/23.
//

import Foundation
import RealmSwift

public class HREntity: Object {
    
    @objc dynamic var id = "12344555"
    @objc dynamic var time = Date()
    var details = List<HRItem>()
    
    public override static func primaryKey() -> String? {
        return "id"
    }
    static func storeHeartRateDataInRealm(_ data: HRModelData) {
        
        let realmObject = DatabaseManager.sharedInstance.realmObject
        if !realmObject.isInWriteTransaction {
            realmObject.beginWrite()
        }
        let hrEntity = HREntity()
        hrEntity.id = "12344555"
        hrEntity.time = data.date
        data.hrDetails.forEach { item in
            let hrItem = HRItem()
            hrItem.hrValue = item.heartRate
            hrItem.startTime = item.time
            hrEntity.details.append(hrItem)
        }
        realmObject.add(hrEntity, update: .all)
        do {
            try realmObject.commitWrite()
        } catch {
            print(error)
        }
    }
}

class HRItem: Object {
    @objc dynamic var startTime: TimeInterval = 0
    @objc dynamic var hrValue : Int = 0
}


