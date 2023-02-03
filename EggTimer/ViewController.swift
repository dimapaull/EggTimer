//
//  ViewController.swift
//  EggTimer
//
//  Created by Mac OS on 29.01.2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var textLabel: UILabel!
    
    
    let eggTimes = ["Soft": 300, "Medium": 420,"Hard": 720]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    var player: AVAudioPlayer!

    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        textLabel.text = "How Do You Like Your Eggs?"
        timer.invalidate()
        progressBar.progress = 0.0
        secondsPassed = 0
        
        let hardness = sender.titleLabel!.text!
        totalTime = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        //example functionality
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
        } else {
            timer.invalidate()
            textLabel.text = "DONE!"
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
}

