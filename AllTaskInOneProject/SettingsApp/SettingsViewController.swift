//
//  SettingsViewController.swift
//  AllTaskInOneProject
//
//  Created by apple on 30/09/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

enum SectionNames: String, CaseIterable {
    case Login = "User Details"
    case General_Settings = "General Settings"
    case Privacy_Settings = "Privacy Settings"
    case Application_Settings = " Application Settings"
    case Developer_Settings = "Developer Settings"
}

extension SectionNames {
    var numberOfSettings: Int {
        switch self {
        case .Login:
            return 1
        case .General_Settings:
            return 3
        case .Privacy_Settings:
            return 1
        case .Application_Settings:
            return 8
        case .Developer_Settings:
            return 1
            
        }
    }
}

enum ArrayOne: String, CaseIterable {
    case General, Accessibility, Privacy
}

extension ArrayOne {
    var sectionOne: String {
        switch self {
        case .General:
            return "General"
        case .Accessibility:
            return "Accessibility"
        case .Privacy:
            return "Privacy"
            
        }
        
    }
}

enum ArrayTwo: String, CaseIterable {
    case PasswordsAccounts = "Passwords & Accounts"
}

enum ArrayThree: String, CaseIterable {
    case Maps, Safari, News, Health, Shortcuts, Siri, Photos, GameCenter
}
enum ArrayFour: String, CaseIterable {
    case Developer
}


class SettingsViewController: UIViewController {

    var sectionArr1 = ["General", "Accessibility","Privacy"]
    var sectionArr2 = [ "Passwords & Accounts"]
    var sectionArr3 = ["Maps", "Safari", "News","Health", "Shortcuts","Siri & Search","Photos","Game Center"]
    var sectionArr4 = ["Developer"]
    
    
    var sectionIcon1 = ["General", "Accessebility", "Privacy"]
    var sectionIcon2 = ["Accounts"]
    var sectionIcon3 = ["Maps", "Safari", "News", "Health", "Shortcuts", "Siri", "Photos", "GameCenter"]
    var sectionIcon4 = ["Developer"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        navigationItem.title = "Settings"
        tableView.register(UINib(nibName: "SettingsOneTableViewCell", bundle: nil), forCellReuseIdentifier: "settingOne")
        tableView.register(UINib(nibName: "SettingsTwoTableViewCell", bundle: nil), forCellReuseIdentifier: "settingTwo")
    }
    
    
}

extension SettingsViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //   return SectionNames.allCases[section].numberOfSettings
        
        if section == 0{
            return 1
        }else if section == 1{
            return 3
        } else if section == 2{
            return 1
        }else if section == 3{
            return 8
        }
        else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "settingOne", for: indexPath) as! SettingsOneTableViewCell
            cell.label1.text = "Sign In to your iPhone"
            cell.label2.text = "Set up iCloud, the Appstore and more."
            return cell
            
        }else if indexPath.section == 1{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "settingTwo", for: indexPath) as! SettingsTwoTableViewCell
            cell.label.text = sectionArr1[indexPath.row]
            cell.images!.image = UIImage(named: sectionIcon1[indexPath.row])
            cell.images.layer.cornerRadius = 20
            return cell
        }
        else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "settingTwo", for: indexPath) as! SettingsTwoTableViewCell
            cell.label.text = sectionArr2[indexPath.row]
            cell.images!.image = UIImage(named: sectionIcon2[indexPath.row])
            cell.images.layer.cornerRadius = 20
            return cell
        }
        else if indexPath.section == 3{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "settingTwo", for: indexPath) as! SettingsTwoTableViewCell
            cell.label.text = sectionArr3[indexPath.row]
            cell.images!.image = UIImage(named: sectionIcon3[indexPath.row])
            cell.images.layer.cornerRadius = 20
            return cell
        }
            
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "settingTwo", for: indexPath) as! SettingsTwoTableViewCell
            cell.label.text = sectionArr4[indexPath.row]
            cell.images!.image = UIImage(named: sectionIcon4[indexPath.row])
            cell.images.layer.cornerRadius = 20
            return cell
        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
         return SectionNames.allCases.count
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 4 {
            return 60
        }else{
            return 40
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 4 {
            return 50
        }else{
            return 0
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 80
        }else{
            return 60
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return SectionNames.allCases[section].rawValue
    }
}
