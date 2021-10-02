//
//  ElementsInScrollViewController.swift
//  AllTaskInOneProject
//
//  Created by apple on 30/09/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class ElementsInScrollViewController: UIViewController {

     @IBOutlet weak var buttonLabel: UILabel!
        
        @IBOutlet weak var segmentedLabel: UILabel!
        
        @IBOutlet weak var textField: UITextField!
        
        @IBOutlet weak var textFieldLabel: UILabel!

        @IBOutlet weak var sliderLabel: UILabel!
        
        @IBOutlet weak var switchLabel: UILabel!
        
        @IBOutlet weak var activity: UIActivityIndicatorView!
        
        @IBOutlet weak var stepperLabel: UILabel!
        
        @IBOutlet weak var imageview: UIImageView!
        
        @IBOutlet weak var dateSelectedLabel: UILabel!
        
        @IBOutlet weak var datePickerRef: UIDatePicker!

        override func viewDidLoad() {
            super.viewDidLoad()
            
        }
        
        
       
    }

    // UI Button
    extension ElementsInScrollViewController {
        
        @IBAction func buttonTapped(_ sender: UIButton) {
              let alert = UIAlertController(title: "Alert", message: "Button Tapped", preferredStyle: .alert)
              let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
              alert.addAction(ok)
              self.present(alert, animated: true, completion: nil)
              buttonLabel.text = "Button Tapped"
              
          }
    }

    // Segmented Controller
    extension ElementsInScrollViewController {
        

        @IBAction func segmented(_ sender: UISegmentedControl) {
               print(sender.selectedSegmentIndex)
               
               if sender.selectedSegmentIndex == 0 {
               segmentedLabel.text = "Segment First"
               }else {
                   segmentedLabel.text = "Segment Second"
               }
               
           }
           
    }

    //TextField
    extension ElementsInScrollViewController {
        
        @IBAction func doneButtonTapped(_ sender: UIButton) {
            
            textFieldLabel.text = textField.text
            textField.text = ""

        }
        
    }


    // Slider
    extension ElementsInScrollViewController {
        
          @IBAction func slider(_ sender: UISlider) {
            
            sliderLabel.text = String(Int(sender.value))
          }
          
    }

    //Switch
    extension ElementsInScrollViewController{
        
        @IBAction func switch_Tapped(_ sender: UISwitch) {
            
            if sender.isOn {
                
                switchLabel.text = "Switch is On"

            }else {
                switchLabel.text = "Switch is Off"

            }
        }
    }

    //Activity Indicator
    extension ElementsInScrollViewController {
        
        @IBAction func activityIndiButton(_ sender: UIButton) {
            activity.startAnimating()
           }
        
        @IBAction func stop(_ sender: UIButton) {
            activity.stopAnimating()
        }
    }

    // Stepper
    extension ElementsInScrollViewController {
        
        @IBAction func stepperTapped(_ sender: UIStepper) {
            stepperLabel.text = String(sender.value)
        }
    }

    // Image View
    extension ElementsInScrollViewController {
        
        @IBAction func imageButton(_ sender: UIButton) {
            imageview.image = UIImage(named: "Flower")
          }
    }

    extension ElementsInScrollViewController {
        
        @IBAction func datePicker(_ sender: UIDatePicker) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "YYYY-MM-dd"
            let dateString = dateFormatter.string(from: datePickerRef.date)
            dateSelectedLabel.text = "Selected Date: \(dateString)"
            
           }
           
    }
