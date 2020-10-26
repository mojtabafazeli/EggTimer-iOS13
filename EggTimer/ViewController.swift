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
    
    @IBOutlet var headerTitle: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var remainingTime: UILabel!
    
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    var count = -1;
    var timer = Timer()
    var totalTime = 0;
    var hardness = ""
    var player: AVAudioPlayer!
    
   
    @IBAction func hardnessSelected(_ sender: UIButton) {
        if (player != nil) {
            player.stop()
        }
        
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)
        
        hardness = sender.currentTitle!
        count = eggTimes[hardness]!
        totalTime = count
        
    }
        
    @objc func update() {
        if(count > 0) {
            headerTitle.text = hardness
            remainingTime.text = String(count)
            progressBar.progress = Float(count)/Float(totalTime)
            count-=1
        } else if(count == 0) {
            progressBar.progress = 0.0
            headerTitle.text = "Ready!"
            remainingTime.text = "0"
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
    
    @IBAction func restart(_ sender: Any) {
        timer.invalidate()
        progressBar.progress = 1.0
        headerTitle.text = "How do you like your eggs?"
        remainingTime.text = "Remaining Time"
        if (player != nil) {
            player.stop()
        }
    }
}
