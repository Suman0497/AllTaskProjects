//
//  WifiViewController.swift
//  UIDesignLanguages
//
//  Created by apple on 12/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class WifiViewController: UIViewController {
    
    var wifiNetworks = ["Suman's Nest", "Public Wi-Fi", "Wifi", "TP-Link", "Airtel Xtream"]
    
    @IBOutlet weak var wifiTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        wifiTableView.dataSource = self
        wifiTableView.delegate = self
        wifiTableView.register(UINib(nibName: "WifiTableViewCell", bundle: nil), forCellReuseIdentifier: "WifiTableViewCell")
        wifiTableView.register(UINib(nibName: "WIFITwoTableViewCell", bundle: nil), forCellReuseIdentifier: "WIFITwoTableViewCell")
        navigationController?.navigationBar.backgroundColor = .tertiarySystemGroupedBackground
        
        
    }
    
    
    @IBAction func nextButtonTpped(_ sender: Any) {
        
      //  let vc2 = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "ViewController") as! ViewController
        
        
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "LastViewController") as! LastViewController
      //  vc.language = vc2.languageSelected
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
extension WifiViewController: UITableViewDataSource {
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else{
            return wifiNetworks.count
        }
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = wifiTableView.dequeueReusableCell(withIdentifier: "WifiTableViewCell", for: indexPath) as! WifiTableViewCell
            cell.backgroundColor = .tertiarySystemGroupedBackground
            
            return cell
        }else {
            let cell = wifiTableView.dequeueReusableCell(withIdentifier: "WIFITwoTableViewCell", for: indexPath) as! WIFITwoTableViewCell
            cell.backgroundColor = .white
            cell.wifiLabel.text = wifiNetworks[indexPath.row]
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 15)
            return cell
            
        }
        
    }
    
    
}
extension WifiViewController: UITableViewDelegate {
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
        
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "PopUpViewController")
        self.navigationController?.present(vc, animated: true, completion: nil)
    }
    
}
