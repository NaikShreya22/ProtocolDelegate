//
//  VendorDataViewController.swift
//  ProtocolDelegate
//
//  Created by Shreya Naik on 19/07/23.
//

import UIKit


class VendorDataViewController: UIViewController {
    
    @IBOutlet weak var vendorDeatailsLabel: UILabel!
    @IBOutlet weak var featureSelectedLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    var featureSelected: String?
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        vendorDeatailsLabel.text = TitanWatch.current.getVendorDetails()
        if let featureSelected = featureSelected {
            print(featureSelected)
            featureSelectedLabel.text = featureSelected
        }
        valueLabel.text = String(TitanWatch.current.getSpO2Details())
        
      
        
    }
    
    
}

