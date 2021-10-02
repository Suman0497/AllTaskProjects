//
//  TimerViewController.swift
//  AllTaskInOneProject
//
//  Created by apple on 30/09/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    
    var timer = Timer()
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var segmentedControllerOut: UISegmentedControl!
    
    
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            
            //                let currentDateTime = Date()
            //                let formatter = DateFormatter()
            //                formatter.dateFormat = "hh:mm:ss"
            //                formatter.timeStyle = .medium
            //                formatter.dateStyle = .none
            //                let dateTimeString = formatter.string(from: currentDateTime)
            //                timeLabel.text = dateTimeString
            
            
            timeLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .none, timeStyle: .medium)
        }
        else {
            
            
            timeLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .none, timeStyle: .medium)
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .long, timeStyle: .none)
        timeLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .none, timeStyle: .medium)
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(self.tick) , userInfo: nil, repeats: true)
    }
    
    @objc func tick() {
        dateLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .long, timeStyle: .none)
        
        timeLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .none, timeStyle: .medium)
    }
}
