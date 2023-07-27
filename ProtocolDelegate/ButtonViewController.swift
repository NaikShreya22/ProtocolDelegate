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
  
    let hR = HRData()
    

  
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func generateButton(_ sender: UIButton){
        print("data generated")
      
        let heartRate = hR.generateData()

        }
   @IBAction func storedButtonClicked(_ sender: UIButton){
           print("stored Button clicked")
       hR.storeHeartRateDataInRealm(hR.generateData())
           
       }
       
  @IBAction func fetchButtonClicked(_ sender: UIButton){
           print("fetch Button is clicked")
      hR.fetchAndPrintHeartRateData()
           
       }
        

       
      
    }
 

