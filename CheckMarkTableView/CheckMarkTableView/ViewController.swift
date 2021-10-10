//
//  ViewController.swift
//  CheckMarkTableView
//
//  Created by apple on 09/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let userDefaults = UserDefaults.standard
    var checkmark = false
    
    let checkMarkONOff = "onOffKey"
    
    var list = ["Elon","NASA","Mars","Allen", "John", "Smitha", "Alexander", "Joe", "Angelina", "Taylor", "Louis", "Sabrina", "Samanta Austin", "Abraham", "Karolina"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .darkGray
        let userDefaults = UserDefaults.standard

        
    }
    
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Add Task", message: "Add New Task", preferredStyle: .alert)
        
        alert.addTextField {(textField1) in
            textField1.placeholder = "Task Name"
            
        }
        
        let addTaskAction = UIAlertAction(title: "Add Task", style: .default) { (addAction) in
            if let taskName = alert.textFields?.first?.text{
                let toDoList = self.list
                self.list.append(taskName)
                self.tableView.reloadData()
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(addTaskAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
}


extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = list[indexPath.row]
        cell.selectionStyle = .none
        cell.backgroundColor = .darkGray
        cell.textLabel?.textColor = .white
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        checkmark = true
        
        if (tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark) {
     
            userDefaults.set(true, forKey: checkMarkONOff)
        }else{
            userDefaults.set(false, forKey: checkMarkONOff)
            }

        
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        tableView.cellForRow(at: indexPath)?.accessoryType = .none

    }
    
}

