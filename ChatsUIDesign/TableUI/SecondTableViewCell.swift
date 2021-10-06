//
//  SecondTableViewCell.swift
//  TableUI
//
//  Created by apple on 06/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class SecondTableViewCell: UITableViewCell {


        @IBOutlet weak var imageSecond: UIImageView!
        
        
        @IBOutlet weak var nameLabelSecond: UILabel!
        
        
        @IBOutlet weak var messagesLabelSecond: UILabel!
        
        
        
        override func awakeFromNib() {
            super.awakeFromNib()
            imageSecond.layer.cornerRadius = imageSecond.frame.height/2
            imageSecond.layer.borderWidth = 2
            imageSecond.layer.borderColor = UIColor.white.cgColor

            
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

        }
        
    }
