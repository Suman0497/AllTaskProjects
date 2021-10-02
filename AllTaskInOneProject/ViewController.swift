//
//  ViewController.swift
//  AllTaskInOneProject
//
//  Created by apple on 30/09/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

enum Projects: String, CaseIterable {
    
    case sandwich, task_Two_TableView, passing_Data, Elements_In_ScrollView, To_Do_List, Settings_App, Dynamic_CollectionView, ATM_view, Timer_Project, API_Response_Task
}

extension Projects  {
    
    var names: String {
        
        switch self {
        case .sandwich:
            return "Sandwich App"
            
        case .task_Two_TableView:
            return "Task Two TableView"
            
        case .passing_Data:
            return "Passing Data Between Two View Controllers"
            
        case .Elements_In_ScrollView:
            return "Elements In ScrollView"
            
        case .To_Do_List:
            return "To Do List App"
            
        case .Settings_App:
            return "Settings App"
            
        case .Dynamic_CollectionView:
            return "Dynamically Displaying Collection Views"
            
        case .ATM_view:
            return "ATM Card Replica"
            
        case .Timer_Project:
            return "Timer Project"
            
        case .API_Response_Task:
            return "API Response Task"
        }
        
    }
}

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Projects.allCases.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath)
        
        cell.textLabel?.text = Projects.allCases[indexPath.row].names ?? "Sam"
                
        switch indexPath.row {
        case 0 :
            cell.backgroundColor = UIColor.systemOrange
            case 1 :
            cell.backgroundColor = UIColor.systemYellow
            case 2 :
            cell.backgroundColor = UIColor.systemOrange
            case 3 :
            cell.backgroundColor = UIColor.systemYellow
            case 4 :
            cell.backgroundColor = UIColor.systemOrange
            case 5 :
            cell.backgroundColor = UIColor.systemYellow
            case 6 :
            cell.backgroundColor = UIColor.systemOrange
            case 7 :
            cell.backgroundColor = UIColor.systemYellow
            case 8 :
            cell.backgroundColor = UIColor.systemOrange
            case 9 :
            cell.backgroundColor = UIColor.systemYellow
            
        default:
            cell.backgroundColor = UIColor.red
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        switch Projects.allCases[indexPath.row].names {
            
        case "Sandwich App":
            let sb = UIStoryboard.init(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(identifier: "SandwichViewController") as! SandwichViewController
            self.navigationController?.pushViewController(vc, animated: true)
            
            
        case "Task Two TableView":
            let sb = UIStoryboard.init(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(identifier: "Task2TableViewController") as! Task2TableViewController
            self.navigationController?.pushViewController(vc, animated: true)
            
            
        case "Passing Data Between Two View Controllers":
            let sb = UIStoryboard.init(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(identifier: "PassingDataBtwnScreensViewController") as! PassingDataBtwnScreensViewController
            self.navigationController?.pushViewController(vc, animated: true)
            
            
        case "Elements In ScrollView":
            let sb = UIStoryboard.init(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(identifier: "ElementsInScrollViewController") as! ElementsInScrollViewController
            self.navigationController?.pushViewController(vc, animated: true)
            
        case "To Do List App":
            let sb = UIStoryboard.init(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(identifier: "ToDoListViewController") as! ToDoListViewController
            self.navigationController?.pushViewController(vc, animated: true)
            
        case "Settings App":
            let sb = UIStoryboard.init(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(identifier: "SettingsViewController") as! SettingsViewController
            self.navigationController?.pushViewController(vc, animated: true)
            
        case "Dynamically Displaying Collection Views":
            let sb = UIStoryboard.init(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(identifier: "DynamicCollectionViewController") as! DynamicCollectionViewController
            self.navigationController?.pushViewController(vc, animated: true)
            
        case "ATM Card Replica":
            let sb = UIStoryboard.init(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(identifier: "ATMViewController") as! ATMViewController
            self.navigationController?.pushViewController(vc, animated: true)
            
        case "Timer Project":
            let sb = UIStoryboard.init(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(identifier: "TimerViewController") as! TimerViewController
            self.navigationController?.pushViewController(vc, animated: true)
            
        case "API Response Task":
            let sb = UIStoryboard.init(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(identifier: "APIResponseViewController") as! APIResponseViewController
            self.navigationController?.pushViewController(vc, animated: true)
            
        default:
            print("couldnt navigate")
            
        }
        
        
    }
    
    
}
