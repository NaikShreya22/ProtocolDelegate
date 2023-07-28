//
//  ButtonViewController.swift
//  ProtocolDelegate
//
//  Created by Shreya Naik on 18/07/23.
//

import UIKit
import RealmSwift

class ButtonViewController: UIViewController {
    
    @IBOutlet weak var gnButton: UIButton!
    @IBOutlet weak var storedButton: UIButton!
    var hrModel = HRModelData()
    var stepsModel = StepsModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func generateButton(_ sender: UIButton){
        self.hrModel = self.generateHRData()
        self.stepsModel = self.generateStepsData()
        
    }
    @IBAction func storedButtonClicked(_ sender: UIButton){
        print("stored Button clicked")
        HREntity.storeHeartRateDataInRealm(self.hrModel)
        StepsEntity.storeStepsData(self.stepsModel)
    }
    
    @IBAction func fetchButtonClicked(_ sender: UIButton){
        if let data = DatabaseManager.sharedInstance.getHREntityFromLocalDB() {
            print("fetch Button is clicked",data)
        }
        if let data = DatabaseManager.sharedInstance.getStepsEntity() {
            print("fetch Button is clicked",data)
        }
    }
}



class DatabaseManager {
    
    static let sharedInstance = DatabaseManager()
    public var realmObject: Realm {
        var realm: Realm
        do {
            realm = try! Realm(configuration: self.config)
        } catch {
            debugPrint("eror loading Realm!")
        }
        return realm
    }
    
    let config:Realm.Configuration
    
    public required init() {
        let config = Realm.Configuration(
            // Set the new schema version. This must be greater than the previously used
            // version (if you've never set a schema version before, the version is 0).
            schemaVersion:1,
            // Set the block which will be called automatically when opening a Realm with
            // a schema version lower than the one set above
            migrationBlock: { migration, oldSchemaVersion in
                // We haven’t migrated anything yet, so oldSchemaVersion == 0
            })
        self.config = config
        // realmObject = try! Realm(configuration: config)
    }
    
    func getHREntityFromLocalDB() -> HREntity? {
        let stringDate = "12344555"
        if realmObject.objects(HREntity.self).filter("id = %@", stringDate).first != nil {
            return realmObject.objects(HREntity.self).filter("id = %@", stringDate).first
        }
        return nil
    }
    func getStepsEntity() -> StepsEntity?{
        let stringDate = "0089"
        if realmObject.objects(StepsEntity.self).filter("index = %@", stringDate).first != nil {
            return realmObject.objects(StepsEntity.self).filter("index = %@", stringDate).first
        }
        return nil
        
    }
}

extension ButtonViewController{
    private func generateHRData() -> HRModelData {
        
        var hrModel = HRModelData()
        hrModel.date = Date()
        let hrInterval = 5 //Minutes
        var startTime = Date().midNight.timeIntervalSince1970
        for _ in 1...24 {
            if startTime <= Date().timeIntervalSince1970 {
                var heartRateObject = HRDetails()
                heartRateObject.time = TimeInterval(startTime)
                heartRateObject.heartRate = Int.random(in: 60...100)
                hrModel.hrDetails.append(heartRateObject)
                startTime = startTime + Double(60 * hrInterval)
            } else {
                break
            }
        }
        return hrModel
    }
    
    private func generateStepsData() -> StepsModel{
        var stepsModel = StepsModel()
        stepsModel.date = Date()
        let stepInterval = 30 //minute
        var startTime = Date().midNight.timeIntervalSince1970
        for _ in 1...24{
            if startTime <= Date().timeIntervalSince1970{
                var stepsObject = StepsDetails()
                stepsObject.time = startTime
                stepsObject.steps = Int.random(in: 100...1000)
                stepsModel.stepsDetails.append(stepsObject)
                startTime = startTime + Double(60 * stepInterval)
            }else {
                break
            }
        }
        return stepsModel
    }
}
