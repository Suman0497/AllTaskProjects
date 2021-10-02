//
//  SandwichCustomTableViewCell.swift
//  AllTaskInOneProject
//
//  Created by apple on 30/09/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class SandwichCustomTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    
    @IBOutlet weak var imageSet: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
