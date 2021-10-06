//
//  SecondViewController.swift
//  TableUI
//
//  Created by apple on 06/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

   
        let cellSpacingHeight: CGFloat = 10
        
        @IBOutlet weak var searchBarSecond: UISearchBar!
        var filteredChats: [String]!
        var filteredCommunities: [String]!
        
        
        
        let communities = ["Yoga", "Trip", "School", "College", "Besties", "Family", "Job Posts", "Cousins", "Exam Updates"]
        
        let comminitiesMess = ["Today yoga is at 7:30 AM", "Are We going to trip?", "Hello guys", "What was the assignedment given", "Happiest birthdays shivangi", "Hi mom n dad","Hi, All", "Hi, people", "GoodMorning to all"]
    
        let communitiesImages = ["image01", "image02", "image03","image04", "image05", "image06", "image07", "image08", "image09"]

        @IBOutlet weak var segmentOutSecond: UISegmentedControl!
        @IBOutlet weak var tableOutSecond: UITableView!
        

        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            segmentOutSecond.selectedSegmentIndex = 1
            navigationItem.hidesBackButton = true
            tableOutSecond.delegate = self
            tableOutSecond.dataSource = self
            tableOutSecond.register(UINib(nibName: "SecondTableViewCell", bundle: nil), forCellReuseIdentifier: "SecondCell")
            
            segmentOutSecond.addUnderlineForSelectedSegment()
            searchBarSecond.delegate = self
            
            filteredCommunities = communities
           
            
        }
        
        @IBAction func segmentTappedSecond(_ sender: UISegmentedControl) {
            
               
            if segmentOutSecond.selectedSegmentIndex == 0{
                segmentOutSecond.changeUnderlinePositionSecond()

                navigationController?.popViewController(animated: true)

            }else{
                print("Selected 1")
            }
            

            
        }
        

    }



    extension SecondViewController: UITableViewDataSource, UITableViewDelegate {
        
        
        
        func numberOfSections(in tableView: UITableView) -> Int {
            
           
                return self.filteredCommunities.count
            
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return cellSpacingHeight
        }
        
        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView()
            headerView.backgroundColor = UIColor.clear
            return headerView
        }
        
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
                
                let cell = tableOutSecond.dequeueReusableCell(withIdentifier: "SecondCell", for: indexPath) as! SecondTableViewCell
                
                  cell.nameLabelSecond.text = self.filteredCommunities[indexPath.section]
                  cell.messagesLabelSecond.text = self.comminitiesMess[indexPath.section]
                 cell.imageSecond.image = UIImage(named: communitiesImages[indexPath.section])
                  
                  cell.backgroundColor = UIColor.white
                  cell.layer.borderColor = UIColor.black.cgColor
                  cell.layer.borderWidth = 1
                  cell.layer.cornerRadius = 8
                  cell.clipsToBounds = true
                  
                  return cell
                
            }
        
        
        
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 75
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("You tapped cell number \(indexPath.section).")
        }
    }



    extension UISegmentedControl{
        
        func removeBorderSecond(){
            let backgroundImage = UIImage.getColoredRectImageWith(color: UIColor.white.cgColor, andSize: self.bounds.size)
            self.setBackgroundImage(backgroundImage, for: .normal, barMetrics: .default)
            self.setBackgroundImage(backgroundImage, for: .selected, barMetrics: .default)
            self.setBackgroundImage(backgroundImage, for: .highlighted, barMetrics: .default)

            let deviderImage = UIImage.getColoredRectImageWith(color: UIColor.white.cgColor, andSize: CGSize(width: 1.0, height: self.bounds.size.height))
            self.setDividerImage(deviderImage, forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
            self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: .normal)
            self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 67/255, green: 129/255, blue: 244/255, alpha: 1.0)], for: .selected)
        }
        
        func addUnderlineForSelectedSegmentSecond(){
            removeBorderSecond()
            let underlineWidth: CGFloat = self.bounds.size.width / CGFloat(self.numberOfSegments)
            let underlineHeight: CGFloat = 2.0
            let underlineXPosition = CGFloat(selectedSegmentIndex * Int(underlineWidth))
            let underLineYPosition = self.bounds.size.height - 1.0
            let underlineFrame = CGRect(x: underLineYPosition, y: underlineXPosition, width: underlineWidth, height: underlineHeight)
            let underline = UIView(frame: underlineFrame)
            underline.backgroundColor = UIColor(red: 67/255, green: 129/255, blue: 244/255, alpha: 1.0)
            underline.tag = 1
            self.addSubview(underline)
        }

        func changeUnderlinePositionSecond(){
            guard let underline = self.viewWithTag(1) else {return}
            let underlineFinalXPosition = (self.bounds.width / CGFloat(self.numberOfSegments)) * CGFloat(selectedSegmentIndex)
            UIView.animate(withDuration: 0.1, animations: {
                underline.frame.origin.x = underlineFinalXPosition
            })
        }
    }

    extension UIImage{

        class func getColoredRectImageWithSecond(color: CGColor, andSize size: CGSize) -> UIImage{
            UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
            let graphicsContext = UIGraphicsGetCurrentContext()
            graphicsContext?.setFillColor(color)
            let rectangle = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
            graphicsContext?.fill(rectangle)
            let rectangleImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return rectangleImage!
        }


    }


    extension SecondViewController: UISearchBarDelegate{

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

            filteredCommunities = searchText.isEmpty ? communities : communities.filter({(dataString: String) -> Bool in
                return dataString.range(of: searchText, options: .caseInsensitive) != nil
            })

            tableOutSecond.reloadData()
        }

        func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
            self.searchBarSecond.showsCancelButton = true
        }

        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            searchBarSecond.showsCancelButton = false
            searchBarSecond.text = ""
            searchBarSecond.resignFirstResponder()
        }
    }

