//
//  PassingDataBtwnScreensViewController.swift
//  AllTaskInOneProject
//
//  Created by apple on 30/09/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

protocol UpdateColor: class {
    func updateViewColor(color1: UIColor, color2: UIColor, color3: UIColor, color4: UIColor, color5: UIColor, color6: UIColor, color7: UIColor)
   

}

class PassingDataBtwnScreensViewController: UIViewController {

     @IBOutlet weak var label: UILabel!
       @IBOutlet weak var view1: UIView!
       @IBOutlet weak var view2: UIView!
       @IBOutlet weak var view3: UIView!
       @IBOutlet weak var view4: UIView!
       @IBOutlet weak var view5: UIView!
       @IBOutlet weak var view6: UIView!
       @IBOutlet weak var view7: UIView!
       @IBOutlet weak var view8: UIView!
       
       override func viewDidLoad() {
           super.viewDidLoad()
           label.text = "First view controller"
       }
       
       @IBAction func nextButtonTapped(_ sender: UIButton) {
           
           let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "PassingDataSecondViewController") as! PassingDataSecondViewController
           vc.text = label.text!
           vc.delegate = self
           self.navigationController?.pushViewController(vc, animated: true)
       }
}
extension PassingDataBtwnScreensViewController: UpdateColor {
    
    func updateViewColor(color1: UIColor, color2: UIColor, color3: UIColor, color4: UIColor, color5: UIColor, color6: UIColor, color7: UIColor) {
    
        view1.backgroundColor = color1
        view2.backgroundColor = color2
        view3.backgroundColor = color3
        view4.backgroundColor = color4
        view5.backgroundColor = color5
        view6.backgroundColor = color6
        view7.backgroundColor = color7
    
    }
    
   
    
    
}
