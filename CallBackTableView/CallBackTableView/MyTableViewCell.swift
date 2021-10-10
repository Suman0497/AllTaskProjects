//
//  MyTableViewCell.swift
//  CallBackTableView
//
//  Created by apple on 09/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    @IBOutlet weak var labelOut: UILabel!
    
    @IBOutlet weak var viewOutlet: UIView!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func updateUIButtonTapped(_ sender: Any) {
    }
}
