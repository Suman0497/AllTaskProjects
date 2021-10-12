//
//  SetUpViewController.swift
//  UIDesignLanguages
//
//  Created by apple on 12/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class SetUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func setUpManuallyTapped(_ sender: Any) {
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "WifiViewController")
        self.navigationController?.pushViewController(vc, animated: true)

      }

}
