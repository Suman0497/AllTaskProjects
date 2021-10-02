//
//  PassingDataSecondViewController.swift
//  AllTaskInOneProject
//
//  Created by apple on 30/09/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class PassingDataSecondViewController: UIViewController {

      var text = ""
        weak var delegate: UpdateColor?
        
        @IBOutlet weak var label2: UILabel!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            label2.text = text
            
        }
        
        @IBAction func updateColor(_ sender: UIButton) {
            
            delegate?.updateViewColor(color1: .magenta, color2: .systemPink, color3: .yellow, color4: .red, color5: .orange, color6: .systemBlue, color7: .gray)
            
            self.navigationController?.popViewController(animated: true)
        }
        
    }
