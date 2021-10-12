//
//  LastViewController.swift
//  UIDesignLanguages
//
//  Created by apple on 12/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit


class LastViewController: UIViewController {
    
    var language : String? = ""
   // var country: SelectCountryViewController?
    
    
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
        languageLabel.text = language
     //   countryLabel.text = "Country: \(country?.countrySelected)"
    
    
        
    }
    
    
}
