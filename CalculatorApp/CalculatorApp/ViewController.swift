//
//  ViewController.swift
//  CalculatorApp
//
//  Created by apple on 04/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let inset: CGFloat = 10
    let minimumLineSpacing: CGFloat = 10
    let minimumInteritemSpacing: CGFloat = 10
    var cellsPerRow = 4
    
    var numbers: [String] = ["AC" ,"-/+" ,"%" ,"/" ,"7" ,"8" ,"9" ,"*","4" ,"5" ,"6" ,"-", "1", "2", "3", "+", "0", ".", "="]
    
    var workings:String = ""
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var calculatorWorkings: UILabel!
    
    @IBOutlet weak var collectionOutlet: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        collectionOutlet.delegate = self
        collectionOutlet.dataSource = self
        collectionOutlet.contentInsetAdjustmentBehavior = .always
        view.backgroundColor = .black
        collectionOutlet.backgroundColor = .black
        clearAll()
    }
    
    
}


extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numbers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionOutlet.dequeueReusableCell(withReuseIdentifier: "calculatorCell", for: indexPath) as! CalculatorCollectionViewCell
                
        switch numbers[indexPath.item]{
        case "0":
            cell.layer.cornerRadius = 40
        default:
            cell.layer.cornerRadius = cell.frame.width/2
            
        }
        
        switch numbers[indexPath.item] {
        case "AC", "-/+", "%":
            cell.backgroundColor = .lightGray
        case "/", "*", "-", "+", "=":
            cell.backgroundColor = .systemPink
        default:
            cell.backgroundColor = .darkGray
        }
        
        cell.labelInsideButton.text = numbers[indexPath.row]
        return cell
    }
}


extension ViewController: UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        print(numbers[indexPath.item])
        
        if numbers[indexPath.item] == "="{
            if(validInput())
            {
                let checkedWorkingsForPercent = workings.replacingOccurrences(of: "%", with: "*0.01")
                let expression = NSExpression(format: checkedWorkingsForPercent)
                let result = expression.expressionValue(with: nil, context: nil) as! Double
                let resultString = formatResult(result: result)
                resultLabel.text = resultString
            }
            else
            {
                let alert = UIAlertController(
                    title: "Invalid Input",
                    message: "Calculator unable to do math based on input",
                    preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Okay", style: .default))
                self.present(alert, animated: true, completion: nil)
            }
            
            
        } else if numbers[indexPath.item] == "AC"{
            clearAll()
        }
            
        else if numbers[indexPath.item] == "%"{
            addToWorkings(value: "%")
        }
            
        else if numbers[indexPath.item] == "/"{
            addToWorkings(value: "/")
        }
            
        else if numbers[indexPath.item] == "*"{
            addToWorkings(value: "*")
        }
        else if numbers[indexPath.item] == "+"{
            addToWorkings(value: "+")
        }
            
        else if numbers[indexPath.item] == "-"{
            addToWorkings(value: "-")
        }
        else if numbers[indexPath.item] == "."{
            addToWorkings(value: ".")
        }
        else if numbers[indexPath.item] == "0"{
            addToWorkings(value: "0")
        }
        else if numbers[indexPath.item] == "1"{
            addToWorkings(value: "1")
        }
        else if numbers[indexPath.item] == "2"{
            addToWorkings(value: "2")
        }
        else if numbers[indexPath.item] == "3"{
            addToWorkings(value: "3")
        }
        else if numbers[indexPath.item] == "4"{
            addToWorkings(value: "4")
        }
        else if numbers[indexPath.item] == "5"{
            addToWorkings(value: "5")
        }
        else if numbers[indexPath.item] == "6"{
            addToWorkings(value: "6")
        }
        else if numbers[indexPath.item] == "7"{
            addToWorkings(value: "7")
        }
        else if numbers[indexPath.item] == "8"{
            addToWorkings(value: "8")
        }
        else if numbers[indexPath.item] == "9"{
            addToWorkings(value: "9")
        }
        
        
        
        
        return true
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            cell.contentView.backgroundColor = .gray
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            cell.contentView.backgroundColor = nil
        }
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return minimumLineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return minimumInteritemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        let marginsAndInsets = inset * 2 + collectionView.safeAreaInsets.left + collectionView.safeAreaInsets.right + minimumInteritemSpacing * CGFloat(cellsPerRow - 1)
        let itemWidth = ((collectionView.bounds.size.width - marginsAndInsets) / CGFloat(cellsPerRow)).rounded(.down)
        
        if numbers[indexPath.item] == "0" {
            return CGSize(width: 190, height: 85)
        }
        else{
            return CGSize(width: itemWidth, height: itemWidth)
        }
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionOutlet.collectionViewLayout.invalidateLayout()
        super.viewWillTransition(to: size, with: coordinator)
    }
}



//calculator Functions
extension ViewController{
    
    func clearAll()
    {
        workings = ""
        calculatorWorkings.text = ""
        resultLabel.text = ""
    }
    
    func validInput() ->Bool
    {
        var count = 0
        var funcCharIndexes = [Int]()
        
        for char in workings
        {
            if(specialCharacter(char: char))
            {
                funcCharIndexes.append(count)
            }
            count += 1
        }
        
        var previous: Int = -1
        
        for index in funcCharIndexes
        {
            if(index == 0)
            {
                return false
            }
            
            if(index == workings.count - 1)
            {
                return false
            }
            
            if (previous != -1)
            {
                if(index - previous == 1)
                {
                    return false
                }
            }
            previous = index
        }
        
        return true
    }
    
    func specialCharacter (char: Character) -> Bool
    {
        if(char == "*")
        {
            return true
        }
        if(char == "/")
        {
            return true
        }
        if(char == "+")
        {
            return true
        }
        return false
    }
    
    func formatResult(result: Double) -> String
    {
        if(result.truncatingRemainder(dividingBy: 1) == 0)
        {
            return String(format: "%.0f", result)
        }
        else
        {
            return String(format: "%.2f", result)
        }
    }
    
    func addToWorkings(value: String)
    {
        workings = workings + value
        calculatorWorkings.text = workings
    }
}
