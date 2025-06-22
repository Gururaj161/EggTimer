//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    var secondRemaining: Int = 60
    var timer = Timer()
    var timeStart = 0
    
    @IBAction func keyPessed(_ sender: UIButton) {
        timer.invalidate()
        timeStart = eggTimes[sender.currentTitle!] ?? 0
        
        progressView.setProgress(0, animated: false)
        titleLabel.text = "\(sender.currentTitle!) Cooking..."
        secondRemaining = 0
        
        timer =  Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if secondRemaining < timeStart {
            secondRemaining += 1
            progressView.progress = Float(secondRemaining) / Float(timeStart)
            
        } else {
            timer.invalidate()
            self.titleLabel.text = "Done!"
        } }
    
}
