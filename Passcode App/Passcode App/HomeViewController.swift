//
//  HomeViewController.swift
//  Passcode App
//
//  Created by apple on 11/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    let isBlurUI = true
    
    var loginVCID: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
    //    loginVCID = isBlurUI ? "BlurPasswordLoginViewController" : "PasswordLoginViewController"
        loginVCID = isBlurUI ? "PasswordLoginViewController" : "BlurPasswordLoginViewController"
    }
    
    @IBAction func presentLoginVC(_ sender: AnyObject) {
        present(loginVCID)
    }
    
    func present(_ id: String) {
        let loginVC = storyboard?.instantiateViewController(withIdentifier: id)
        loginVC?.modalPresentationStyle = .overCurrentContext
        present(loginVC!, animated: true, completion: nil)
    }
}
