//
//  ButtonViewController.swift
//  ProtocolDelegate
//
//  Created by Shreya Naik on 18/07/23.
//

import UIKit

class ButtonViewController: UIViewController {
    @IBOutlet weak var gnButton: UIButton!
    @IBOutlet weak var storedButton: UIButton!
   // var data:WatchData?
    var timer = Timer()
       var iterations = 0

  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(printTime), userInfo: nil, repeats: true)

             
    }
    @objc func printTime() {
            print(Date())
            iterations += 1
            if iterations == 10 {
                timer.invalidate()
            }
        }
    @IBAction func generateButton(_ sender: UIButton){
        print("data generated")
//        let watchDataArr = generateData()
//        for watchData in watchDataArr{
//            print("Bp:",watchData.bP,"HR:",watchData.hR,"spO2:",watchData.spO2,"steps:",watchData.steps,"Stress",watchData.stress,"Time:",watchData.time
//            )
//        }
        

       
      
    }
    @IBAction func storedButtonClicked(_ sender: UIButton){
        print("stored Button clicked")
        
    }
    
    @IBAction func fetchButtonClicked(_ sender: UIButton){
        print("fetch Button is clicked")
        
    }
//    func generateData() -> [WatchData]{
//        var watchDataArr = [WatchData]()
//        var calender = Calendar.current
//        var now = Date()
//        var startOfDay = calender.startOfDay(for: now)
//
//        let hrInterval:TimeInterval = 5 * 60
//        let spO2Interval:TimeInterval = 60 * 60
//        let stepInterval:TimeInterval = 30 * 60
//        let bpInterval:TimeInterval = 60 * 60
//        let stressInterval:TimeInterval = 10 * 60
//
//        for interval in stride(from: 0, to: now.timeIntervalSince(startOfDay), by: hrInterval){
//            let time = calender.date(byAdding: .second, value: Int(interval), to: startOfDay)
//            let hr = Int.random(in: 50...150)
//            let spo2 = Int.random(in: 80...100)
//            let step = Int.random(in: 100...1000)
//            let bp = Int.random(in: 80...120)
//            let stress = Int.random(in: 40...100)
//
//            let watchData = WatchData(hR: hr, stress:stress, spO2: spo2,steps: step,bP: bp)
//            watchDataArr.append(watchData)
//
//
//
//        }
//        return watchDataArr
//
//
//    }
  
    
    
  

}
