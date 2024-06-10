//
//  ResultsViewController.swift
//  BMI Calculator
//
//  Created by sohail shaik on 6/10/24.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var bmiValueString:String?
    var adviceString:String?
    var color:UIColor?
    
    @IBOutlet weak var bmiValue: UILabel!
    @IBOutlet weak var advice: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiValue.text = bmiValueString
        advice.text = adviceString
        view.backgroundColor = color
            }
    
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)    }
    
    
    
}
