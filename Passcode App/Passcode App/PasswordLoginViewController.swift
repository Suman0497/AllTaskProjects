//
//  PasswordLoginViewController.swift
//  Passcode App
//
//  Created by apple on 11/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit
import SmileLock

class PasswordLoginViewController: UIViewController {

    @IBOutlet weak var passwordStackView: UIStackView!
    
    var passwordContainerView: PasswordContainerView!
    let kPasswordDigit = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //create PasswordContainerView
        passwordContainerView = PasswordContainerView.create(in: passwordStackView, digit: kPasswordDigit)
        passwordContainerView.delegate = self
        passwordContainerView.deleteButtonLocalizedTitle = "Delete"
        
        //customize password UI
        passwordContainerView.tintColor = UIColor.color(.textColor)
        passwordContainerView.highlightedColor = UIColor.color(.blue)
    }
}

extension PasswordLoginViewController: PasswordInputCompleteProtocol {
    func passwordInputComplete(_ passwordContainerView: PasswordContainerView, input: String) {
        if validation(input) {
            validationSuccess()
        } else {
            validationFail()
        }
    }
    
    func touchAuthenticationComplete(_ passwordContainerView: PasswordContainerView, success: Bool, error: Error?) {
        if success {
            self.validationSuccess()
        } else {
            passwordContainerView.clearInput()
        }
    }
}

private extension PasswordLoginViewController {
    func validation(_ input: String) -> Bool {
        return input == "1234"
    }
    
    func validationSuccess() {
        print("*️⃣ success!")
        dismiss(animated: true, completion: nil)
//        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "ViewController")
//        vc.modalPresentationStyle = .overCurrentContext
//        present(vc, animated: true, completion: nil)
    }
    
    func validationFail() {
        print("*️⃣ failure!")
        passwordContainerView.wrongPassword()
    }
}
