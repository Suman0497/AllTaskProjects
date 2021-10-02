//
//  DynamicCollectionViewCell.swift
//  AllTaskInOneProject
//
//  Created by apple on 30/09/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class DynamicCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var numbersLabel: UILabel!
        
        func counting(with counts: String){
            numbersLabel.text = counts
            
        }
    }
