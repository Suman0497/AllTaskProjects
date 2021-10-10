//
//  ThirdTableViewCell.swift
//  CvInsideTV
//
//  Created by apple on 08/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class ThirdTableViewCell: UITableViewCell {

    
    @IBOutlet weak var images: UIImageView!
    
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var labelDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
       // images.layer.cornerRadius = images.frame.size.width / 2
        images.layer.cornerRadius = 20
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
