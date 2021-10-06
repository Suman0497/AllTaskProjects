//
//  CustomTableViewCell.swift
//  TableUI
//
//  Created by apple on 05/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var images: UIImageView!
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    @IBOutlet weak var messagesLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        images.layer.cornerRadius = images.frame.height/2
        images.layer.borderWidth = 2
        images.layer.borderColor = UIColor.white.cgColor
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
