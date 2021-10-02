//
//  APIResponseViewController.swift
//  AllTaskInOneProject
//
//  Created by apple on 02/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class APIResponseViewController: UIViewController {

        @IBOutlet weak var activityIndiCatorOutlet: UIActivityIndicatorView!
        
        @IBOutlet weak var responseLabel: UILabel!
        
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=london&appid=45d9c7c19ebd6765a21fbb804fdf534a"
        
        override func viewDidLoad() {
            super.viewDidLoad()
        }
        
        
        @IBAction func fetchButtonTapped(_ sender: UIButton) {
            activityIndiCatorOutlet.startAnimating()
            if  let url = URL(string: urlString){
                let session = URLSession(configuration: .default)
                
                let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
                
                task.resume()
            }
        }
        
        func handle(data: Data?, response: URLResponse?, error: Error?){
            if error != nil{
                print(error!)
                return
            }
            if let safeData = data{
                let dataString = String(data: safeData, encoding: .utf8)
                print(dataString)
                
                DispatchQueue.main.async {
                    self.activityIndiCatorOutlet.stopAnimating()
                    self.responseLabel.text = dataString
                }
            }
        }
    }

