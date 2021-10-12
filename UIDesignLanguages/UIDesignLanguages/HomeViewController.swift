//
//  HomeViewController.swift
//  UIDesignLanguages
//
//  Created by apple on 12/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true

    }
    

    @IBAction func getStartedButtonTapped(_ sender: Any) {
        
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "ViewController")
        self.navigationController?.pushViewController(vc, animated: true)
        

    }
    
}

