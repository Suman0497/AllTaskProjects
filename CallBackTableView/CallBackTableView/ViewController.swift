//
//  ViewController.swift
//  CallBackTableView
//
//  Created by apple on 09/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

protocol UpdateUITwice: class {
    func NumberOfCellsToDouble(numberOfRowsInSection: Int)
}

class ViewController: UIViewController {
    

    var norOfCells = 2
    

    @IBOutlet weak var tableOut: UITableView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableOut.dataSource = self
        tableOut.delegate = self
        tableOut.register(UINib(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: "MyTableViewCell")
    }
    
    var counter=0;
    @IBAction func nextTapped(_ sender: Any) {
        
        counter += 2
              print("Countered \(counter)")
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "secondVC") as! SecondViewController
        vc.delegate = self
        print(norOfCells)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(norOfCells)
        return norOfCells
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableOut.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath) as! MyTableViewCell
        cell.labelOut.text = "Hello world"
        
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate{
    
}


extension ViewController: UpdateUITwice {
    
   func NumberOfCellsToDouble(numberOfRowsInSection: Int){
    norOfCells = counter * counter
        tableOut.reloadData()
    }


}
