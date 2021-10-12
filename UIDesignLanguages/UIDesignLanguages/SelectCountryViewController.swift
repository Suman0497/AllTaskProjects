//
//  SelectCountryViewController.swift
//  UIDesignLanguages
//
//  Created by apple on 12/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class SelectCountryViewController: UIViewController {
    
    var countrySelected = ""
    @IBOutlet weak var tableviewContry: UITableView!
    
    let country = ["Unites States"]
    let countries = ["Afghanistan", "Argentina", "Australia", "Austria", "Bangladesh", "Bahrain", "Belguim", "Bolivia", "Brazil", "Bulgaria", "Cambodia", "Cannada", "China", "Colombia", "Cuba", "Denmark", "Egypt", "Finland", "France", "Georgia", "Germany", "Hungary","India", "Iceland","Indonesia", "Iran", "Iraq", "Jamaica", "Japan", "Jordan", "Kenya", "Kuwait", "Malaysia", "Maldives", "Norway", "New Zealand", "Palestine", "Peru", "Philippines"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableviewContry.dataSource = self
        tableviewContry.delegate = self
        tableviewContry.register(UINib(nibName: "SelectCountryTableViewCell", bundle: nil), forCellReuseIdentifier: "SelectCountryTableViewCell")
        
    }
    
    
    
}
extension SelectCountryViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        else if section == 1 {
            return country.count
            
        }else{
            return countries.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableviewContry.dequeueReusableCell(withIdentifier: "SelectCountryTableViewCell", for: indexPath) as! SelectCountryTableViewCell
            cell.backgroundColor = .tertiarySystemGroupedBackground
            return cell
        }
        else if indexPath.section == 1{
            let cell = tableviewContry.dequeueReusableCell(withIdentifier: "selectCountryCell", for: indexPath)
            cell.backgroundColor = .white
            cell.textLabel?.text = country[indexPath.row]
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 15)
            return cell
            
        }else {
            let cell = tableviewContry.dequeueReusableCell(withIdentifier: "selectCountryCell", for: indexPath)
            cell.backgroundColor = .white
            cell.textLabel?.text = countries[indexPath.row]
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 15)
            return cell
            
        }
    }
    
    
}
extension SelectCountryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0{
            return 250
        }
        else{
            return 60
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 0
        }else if section == 1{
            return 0
        }
        else{
            return 30
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row + 1)
        
        let currentCell = tableView.cellForRow(at: indexPath)
        
        countrySelected = (currentCell?.textLabel?.text!)!
        print(countrySelected)
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "SetUpViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
