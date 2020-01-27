//
//  ChangeTableViewController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by David Lin on 11/20/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ChangeTableViewController: UIViewController {

    @IBOutlet weak var sliderValue: UISlider!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var slideStepTracker: UILabel!
    
 
    
    
    override func viewDidLoad() {
        stepper.maximumValue = 50
    }
    
    
    
    @IBAction func sliderFunc(_ sender: UISlider) {
        stepper.value = Double(sender.value)
        slideStepTracker.text = "Preview Font Size: \(Int(sender.value).description)"
    }
    
    @IBAction func stepperFunc(_ sender: UIStepper) {
        sliderValue.value = Float(sender.value)
        slideStepTracker.text = " Preview Font Size: \(Int(sender.value).description)"
        
        
    }
}
