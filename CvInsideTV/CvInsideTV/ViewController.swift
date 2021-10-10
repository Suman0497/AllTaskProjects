//
//  ViewController.swift
//  CvInsideTV
//
//  Created by apple on 08/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableOut: UITableView!

    var techImages = ["news1", "news2", "news3", "news4", "news5", "news6", "news7", "news8", "news9"]
    
    var techNews = [
        "Vitamin A treatment trial for Covid loss of smell",
        "Facebook to act on illegal sale of Amazon rainforest","China's Xi vows 'reunification' with Taiwan", "Energy price cap not fit for purpose - suppliers", "Nations agree to 15% minimum corporate tax rate", "Mars scientists now know where to look for life", "'How I escaped a hidden world of gangs and exploitation'", "Kristen Stewart: Why playing Diana made me nervous", "Doctors warned about 'dry scooping' fitness fad"]
    
    var posted = ["posted 30mins ago","posted 2hours ago", "posted 3hours ago", "posted 4hours ago", "posted 5hours ago", "posted 6hours ago", "posted 7hours ago", "posted 8hours ago","posted 9hours ago"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        tableOut.dataSource = self
        tableOut.delegate = self
        navigationController?.isNavigationBarHidden = true
        
        UITableViewHeaderFooterView.appearance().tintColor = .black
        view.backgroundColor = .black
        tableOut.register(UINib(nibName: "FirstSectionTableViewCell", bundle: nil), forCellReuseIdentifier: "FirstSectionTableViewCell")
        tableOut.register(UINib(nibName: "SecondTableViewCell", bundle: nil), forCellReuseIdentifier: "SecondTableViewCell")
         tableOut.register(UINib(nibName: "ThirdTableViewCell", bundle: nil), forCellReuseIdentifier: "ThirdTableViewCell")
        
    }

}


extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        default:
            return techImages.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch indexPath.section{
        case 0:
            let cell = tableOut.dequeueReusableCell(withIdentifier: "FirstSectionTableViewCell", for: indexPath) as! FirstSectionTableViewCell

          // cell.backgroundColor = UIColor(red: 70/255, green: 70/255, blue: 90/255, alpha: 1)
            cell.backgroundColor = .black

            return cell

        case 1:
            let cell = tableOut.dequeueReusableCell(withIdentifier: "SecondTableViewCell", for: indexPath) as! SecondTableViewCell
            cell.backgroundColor = .black
            return cell

        default:
            let cell = tableOut.dequeueReusableCell(withIdentifier: "ThirdTableViewCell", for: indexPath) as! ThirdTableViewCell
            cell.backgroundColor = .black
            cell.images.image = UIImage(named: techImages[indexPath.row])
            cell.label1.text = posted[indexPath.row]
            cell.labelDescription.text = techNews[indexPath.row]
            return cell

        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.section {
        case 0:
            return 320
        case 1:
            return 150
        default:
            return 80
        }
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Technology"
        }
        else if section == 1{
            return "Latest from following"
        }else{
            return "My Newsletters"
        }
    }
    
}


extension ViewController: UITableViewDelegate{
    
      func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.contentView.backgroundColor = .black
            headerView.backgroundView?.backgroundColor = .black
            headerView.textLabel?.textColor = .white
        
            headerView.textLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        }
    }
}
