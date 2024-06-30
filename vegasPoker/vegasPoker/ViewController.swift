//
//  ViewController.swift
//  vegasPoker
//
//  Created by sohail shaik on 5/19/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImageOne: UIImageView!
    @IBOutlet weak var diceImageTwo: UIImageView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        let images = [UIImage(imageLiteralResourceName: "DiceOne"),
         UIImage(imageLiteralResourceName: "DiceTwo"),
         UIImage(imageLiteralResourceName: "DiceThree"),
         UIImage(imageLiteralResourceName: "DiceFour"),
         UIImage(imageLiteralResourceName: "DiceFive"),
         UIImage(imageLiteralResourceName: "DiceSix")]
        
        diceImageOne.image = images[Int.random(in: 0...5)]
        diceImageTwo.image = images[Int.random(in: 0...5)]
        
    }

}

