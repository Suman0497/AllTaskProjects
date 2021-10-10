//
//  SecondViewController.swift
//  CallBackTableView
//
//  Created by apple on 09/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit



class SecondViewController: UIViewController {
    
    weak var delegate : UpdateUITwice?

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func updateButtonTappedSecond(_ sender: Any) {
    
        delegate?.NumberOfCellsToDouble(numberOfRowsInSection: 2)

        navigationController?.popViewController(animated: true)

    }
    
}
