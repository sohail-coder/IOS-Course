//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    
    let expectedTime: [String: Int] = ["Soft":5,"Medium":7,"Hard":12]
    var time:Int=0
    var elapsedTime:Int=0
    var timer:Timer?
    @IBOutlet weak var bannerText: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var sound: AVAudioPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.setProgress(0.0, animated: true)
        
    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        timer?.invalidate()
        progressBar.setProgress(0.0, animated: true)
        elapsedTime=0
        bannerText.text = "Cooking!!!"
        time = expectedTime[sender.currentTitle!]!
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    @objc func updateCounter() {
        if elapsedTime < time {
            elapsedTime += 1
            progressBar.setProgress(Float(elapsedTime)/Float(time), animated:true)
        }
        if(elapsedTime==time){
            playSound()
            timer?.invalidate()
            
        }
    }
    func playSound() {
        
        if let path = Bundle.main.path(forResource: "alarm_sound", ofType: "mp3") {
            do {
                sound = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                bannerText.text = "Done!"
                sound.play()
            } catch {
                print( "Could not find file")
            }
        }
    }
    
}




