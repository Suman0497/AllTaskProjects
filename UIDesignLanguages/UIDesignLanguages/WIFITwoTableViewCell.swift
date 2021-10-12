//
//  WIFITwoTableViewCell.swift
//  UIDesignLanguages
//
//  Created by apple on 12/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class WIFITwoTableViewCell: UITableViewCell {

    
    @IBOutlet weak var wifiLabel: UILabel!
    
    @IBOutlet weak var wifiImage: UIImageView!
    
    @IBOutlet weak var lockImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
