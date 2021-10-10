//
//  ViewController.swift
//  ColorSlider
//
//  Created by apple on 08/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var background: UIView!
    
    @IBOutlet weak var sliderOne: UISlider!
    
    @IBOutlet weak var sliderTwo: UISlider!
    
    
    @IBOutlet weak var sliderThree: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func sliderOne(_ sender: Any) {
        let redValue = CGFloat(sliderOne.value)
        let greenValue = CGFloat(sliderTwo.value)
        let blueValue = CGFloat(sliderThree.value)
        
        background.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1)
      }
    
}

