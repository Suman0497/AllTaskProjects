//
//  ToDoListTableViewCell.swift
//  AllTaskInOneProject
//
//  Created by apple on 30/09/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class ToDoListTableViewCell: UITableViewCell {

  var user: ListModel? {
            didSet {
                guard let user = user else { return }

                favImage.isHidden = !user.isFavorite
            }
        }

        @IBOutlet weak var favImage: UIImageView!
        override func awakeFromNib() {
            super.awakeFromNib()
            favImage.image = UIImage(named: "fav")
            favImage.isHidden = true
            
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

        }
        
    }

