//
//  SettingsOneTableViewCell.swift
//  AllTaskInOneProject
//
//  Created by apple on 30/09/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class SettingsOneTableViewCell: UITableViewCell {

     @IBOutlet weak var profileImage: UIImageView!
        
        @IBOutlet weak var label1: UILabel!
        
        @IBOutlet weak var label2: UILabel!
        
        override func awakeFromNib() {
            super.awakeFromNib()
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

            // Configure the view for the selected state
        }
        
    }
