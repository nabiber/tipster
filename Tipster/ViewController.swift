//
//  ViewController.swift
//  Tipster
//
//  Created by Nabib El-RAHMAN on 8/24/14.
//  Copyright (c) 2014 Nabib El-RAHMAN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    var defaults = NSUserDefaults.standardUserDefaults()
    
    var tipPercentages = [0.18, 0.2, 0.22]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        refreshDefaultTip()
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        // Do any additional setup after loading the view, typically from a nib.
        refreshDefaultTip();
    }

    @IBAction func onEditingChange(sender: AnyObject) {
        
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = (billField.text as NSString).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }
    
    func refreshDefaultTip() {
        var defaultTipPercentage = defaults.doubleForKey("DEFAULT_TIP")
        
        for (index, value) in enumerate(tipPercentages) {
            
            if (value == defaultTipPercentage) {
                tipControl.selectedSegmentIndex = index
            }
        }
    }

    @IBAction func onTap(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}

