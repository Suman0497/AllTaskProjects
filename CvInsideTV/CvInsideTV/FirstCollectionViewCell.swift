//
//  FirstCollectionViewCell.swift
//  CvInsideTV
//
//  Created by apple on 08/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class FirstCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var techImages: UIImageView!
    
    @IBOutlet weak var techNews: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       techImages.layer.cornerRadius = 30
    }

}
