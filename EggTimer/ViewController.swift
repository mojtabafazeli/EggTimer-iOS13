//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var headerTitle: UILabel!
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    var count = -1;
    override func viewDidLoad() {
        super.viewDidLoad()
        var timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)
    }
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        count = eggTimes[hardness]!
    }
        
    @objc func update() {
        if(count > 0) {
            headerTitle.text = "Come back in\n" + String(count) + "\nseconds"
            count-=1
        } else if(count == 0) {
            headerTitle.text = "Ready!"
        }
    }
}
