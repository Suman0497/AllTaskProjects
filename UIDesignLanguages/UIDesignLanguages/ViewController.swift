//
//  ViewController.swift
//  UIDesignLanguages
//
//  Created by apple on 12/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var languageSelected = ""

    
    let languagesArray = ["Mandarin Chinese", "Spanish", "English", "Hindi", "Bengali", "Portuguese", "Russian", "Japanese", "Punjabi", "Marathi", "Telugu", "Turkish", "Korean", "French", "German", "Vietnamese", "Tamil", "Arabic", "Italian", "Gujarati", "Bhojpuri"]
    
        
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableViewOutlet.dataSource = self
        tableViewOutlet.delegate = self
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.backgroundColor = .tertiarySystemGroupedBackground
        tableViewOutlet.register(UINib(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: "MyTableViewCell")
        
    }
    
    
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else{
            return languagesArray.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.section == 0 {
            let cell = tableViewOutlet.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath) as! MyTableViewCell
            cell.worldImage.image = UIImage(named: "world.png")
            cell.backgroundColor = .tertiarySystemGroupedBackground
            
            return cell
        }else {
            
            let cell = tableViewOutlet.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.backgroundColor = .white
            cell.textLabel?.text = languagesArray[indexPath.row]
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 15)

            return cell
        }
    }

}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0{
            return 250
        }
        else{
            return 60
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row + 1)
        
        let currentCell = tableViewOutlet.cellForRow(at: indexPath)
        languageSelected = (currentCell?.textLabel?.text!)!
        print(languageSelected)
        
  
    
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "SelectCountryViewController")

        self.navigationController?.pushViewController(vc, animated: true)
        
        

    }

    
}

