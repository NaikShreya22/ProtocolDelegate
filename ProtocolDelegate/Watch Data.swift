//
//  Watch Data.swift
//  ProtocolDelegate
//
//  Created by Shreya Naik on 18/07/23.
//

import Foundation

import RealmSwift

public class HRData: Object{
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var heartRate: Int = 0
    //@objc dynamic var time = Date()
    public override static func primaryKey() -> String? {
           return "id"
       }
    
  public  func generateData() -> [HRData]{
        var heartRateData: [HRData] = []
        let hrInterval:TimeInterval = 5 * 60
      
      for interval in 1...24 {
                let heartRateObject = HRData()
                heartRateObject.heartRate = Int.random(in: 60...100)
    
                heartRateData.append(heartRateObject)
            }
            
            return heartRateData
    }
  public  func storeHeartRateDataInRealm(_ data: [HRData]) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(data, update: .all)
            }
            print("Heart rate data stored successfully!")
        } catch {
            print("Error while storing heart rate data: \(error.localizedDescription)")
        }
    }
   public func fetchAndPrintHeartRateData() {
        do {
            let realm = try Realm()
            let heartRateData = realm.objects(HRData.self)
            
            for dataPoint in heartRateData {
                print("ID: \(dataPoint.id), Heart Rate: \(dataPoint.heartRate)")
            }
        } catch {
            print("Error while fetching heart rate data: \(error.localizedDescription)")
        }
    }
    

}
