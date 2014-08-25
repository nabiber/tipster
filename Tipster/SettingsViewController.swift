//
//  SettingsViewController.swift
//  Tipster
//
//  Created by Nabib El-RAHMAN on 8/25/14.
//  Copyright (c) 2014 Nabib El-RAHMAN. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var defaultTipPercentageControl: UISegmentedControl!

    var defaultTipPercentages = [0.18, 0.2, 0.22]
    var defaultTipPercentage = 0.00
    var defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
       
        defaultTipPercentage = defaults.doubleForKey("DEFAULT_TIP")
            
        for (index, value) in enumerate(defaultTipPercentages) {
                
            if (value == defaultTipPercentage) {
                    
                defaultTipPercentageControl.selectedSegmentIndex = index
            }
        }
            
      
        
        defaults.setDouble(defaultTipPercentage, forKey: "DEFAULT_TIP")
        defaults.synchronize()
    }
    
    
    @IBAction func tipChanged(sender: AnyObject) {
        var percentage = defaultTipPercentages[defaultTipPercentageControl.selectedSegmentIndex]
        
        defaults.setDouble(percentage, forKey: "DEFAULT_TIP")
        defaults.synchronize()
    }
    
}

