//
//  ViewController.swift
//  ProtocolDelegate
//
//  Created by Shreya Naik on 13/07/23.
//

import UIKit

class TitanWatch {
    static var current: VendorActions = Linwear()
}

class ViewController: UIViewController {
    
    @IBOutlet weak var results: UITextField!
    var indexvalue = 0
    var vendorIndex = 0
    
    var currentFeature: String = "HeartRate"

    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.updateVendor(value: self.vendorIndex)
    }
    

    @IBAction func SelectedVendorSegment(_ sender: UISegmentedControl) {
        self.vendorIndex = sender.selectedSegmentIndex
        self.updateVendor(value: self.vendorIndex)
    }
    
    @IBAction func SelectedFeatureSegement(_ sender: UISegmentedControl) {
        self.indexvalue = sender.selectedSegmentIndex
        self.updateData(value:self.indexvalue)
    }
     
    
    private func updateData(value: Int){
        switch value {
        case 0 :
             let Hr =  TitanWatch.current.getHeartRateDetails()
                results.text = String(describing: Hr)
                currentFeature = "HeartRate"
            
        case 1:
             let spO2 =  TitanWatch.current.getSpO2Details()
                results.text = String(describing: spO2)
            currentFeature = "Spo2"
            
        case 2:
              let sleep =  TitanWatch.current.getSleepDetails()
                results.text = String(describing: sleep)
            currentFeature = "Sleep"
            
        case 3:
             let temp =  TitanWatch.current.getTempDetails()
                results.text = String(describing: temp)
            currentFeature = "temp"
            
        case 4:
            let step =  TitanWatch.current.getStepDetails()
                results.text = String(describing: step)
            currentFeature = "Steps"
        default:
            print("error")
        }
    }
    
    private func updateVendor(value:Int) {
        
        switch value {
        case 0:
            TitanWatch.current = Linwear()
            self.updateData(value:self.indexvalue)
        case 1:
            TitanWatch.current = Ido()
            self.updateData(value:self.indexvalue)
        case 2:
            TitanWatch.current = Yawell()
            self.updateData(value:self.indexvalue)
        default:
            print("error")
        }
    }
}



extension ViewController{
    
    @IBAction func buttonClicked(_ sender : UIButton){
       
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        if let vc = storyboard.instantiateViewController(withIdentifier: "ButtonViewController") as? ButtonViewController{
        
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
   @IBAction func vendorButton(_ sender : UIButton){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        if let vc = storyboard.instantiateViewController(withIdentifier: "VendorDataViewController") as? VendorDataViewController{
            
            vc.featureSelected = currentFeature
            
           self.navigationController?.pushViewController(vc, animated: true)
           
        }
        
    }
}



