//
//  SandwichViewController.swift
//  AllTaskInOneProject
//
//  Created by apple on 30/09/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class SandwichViewController: UIViewController {
    
    var name = ["Paneer and corn Burger", "Spicy Paneer Burger", "Aloo Tikki Burger", "chinese Burger","Cheesy Stuffed Veggie burger", "Veg Burger", "Chicken Burger", "Kebab Burger", "Tomato Stuffed Burger", " Chilli burger With Pepper Relish", " Crunchy Chicken Burger", "Mashroom Burger"]
    
    var burger = ["burger1", "burger2", "burger3","burger4","burger5","burger6","burger7", "burger8", "burger9", "burger10","burger11","burger12"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "SandwichCustomTableViewCell", bundle: nil), forCellReuseIdentifier: "SandwichCustomCell")
    }
 

}


extension SandwichViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SandwichCustomCell", for: indexPath) as! SandwichCustomTableViewCell
        cell.titleLabel.text = name[indexPath.row]
        cell.imageSet.image = UIImage(named: burger[indexPath.row])
        
        cell.descriptionLabel.text = "A hamburger is a food, typically considered a sandwich, consisting of one or more cooked patties of ground meat, usually beef, placed inside a sliced bread roll or bun. The patty may be pan fried, grilled, smoked or flame broiled."
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
}

extension SandwichViewController: UITableViewDelegate {
    
}
