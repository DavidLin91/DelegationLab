//
//  ChangeTableViewController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by David Lin on 11/20/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit


protocol itemCellDelegate: AnyObject {
    func fontSizeChanged(changevc: ChangeTableViewController, fontSize: CGFloat)
}

class ChangeTableViewController: UIViewController {

    @IBOutlet weak var sliderValue: UISlider!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var slideStepTracker: UILabel!
    
    weak var delegate: itemCellDelegate?
    
    var initialFont: CGFloat = 14
    
    var fontSize: CGFloat = 14 {
        didSet {
            initialFont = fontSize
            sliderValue.value = Float(fontSize)
            stepper.value = Double(fontSize)
            delegate?.fontSizeChanged(changevc: self, fontSize: fontSize)
        }
    }
    
    override func viewDidLoad() {
        fontSize = initialFont
       sliderChange()
        stepperChange()
    }
    
    
    func sliderChange() {
        sliderValue.minimumValue = 1.0
        sliderValue.maximumValue = 40
        sliderValue.value = Float(fontSize)
    }
    
    func stepperChange() {
        stepper.minimumValue = 1.0
        stepper.maximumValue = 40
        stepper.value = Double(fontSize)
    }
    

    
    @IBAction func sliderFunc(_ sender: UISlider) {
        fontSize = CGFloat(sender.value)
        slideStepTracker.text = "Preview Font Size: \(Int(sender.value).description)"
    }
    
    @IBAction func stepperFunc(_ sender: UIStepper) {
        fontSize = CGFloat(sender.value)
        slideStepTracker.text = " Preview Font Size: \(Int(sender.value).description)"
    }
}
