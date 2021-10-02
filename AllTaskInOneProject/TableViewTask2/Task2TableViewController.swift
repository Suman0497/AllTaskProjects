//
//  Task2TableViewController.swift
//  AllTaskInOneProject
//
//  Created by apple on 30/09/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class Task2TableViewController: UIViewController {
    
    var fruits:[String] = ["Apple", "Orange", "Guava", "Watermelon", "Muskmelon", "Grapes", "Kiwi", "Chikku"]
    
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        tableview.delegate = self
    }


    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
       // fruits.removeAll()
     //   fruits.append("Jackfruit")
        fruits.insert("Custard Apple", at: 0)
        tableview.reloadData()

        
    }
}

extension Task2TableViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "Task2Cell", for: indexPath)
        cell.textLabel?.text = fruits[indexPath.row]
        return cell
        
    }
    
    
    
}
