//
//  BlurPasswordLoginViewController.swift
//  Passcode App
//
//  Created by apple on 11/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit
import SmileLock

class BlurPasswordLoginViewController: UIViewController {

    @IBOutlet weak var passwordStackView: UIStackView!
    
    var passwordUIValidation: MyPasswordUIValidation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //create PasswordUIValidation subclass
        passwordUIValidation = MyPasswordUIValidation(in: passwordStackView)
        
        passwordUIValidation.success = { [weak self] _ in
            
            print("*️⃣ success!")
            self?.dismiss(animated: true, completion: nil)
        }
        
        passwordUIValidation.failure = {
            //do not forget add [weak self] if the view controller become nil at some point during its lifetime
            print("*️⃣ failure!")
        }
        
        //visual effect password UI
        passwordUIValidation.view.rearrangeForVisualEffectView(in: self)
        
        passwordUIValidation.view.deleteButtonLocalizedTitle = "delete"
        
        // customize font
//        for inputView in passwordUIValidation.view.passwordInputViews {
//             inputView.labelFont = UIFont(name: "Chalkduster", size: 29)
//        }
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//
//        // manually initiate biometric authentication
//        self.passwordUIValidation.view.touchAuthentication()
//    }
}
