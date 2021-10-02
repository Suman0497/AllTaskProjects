//
//  ATMViewController.swift
//  AllTaskInOneProject
//
//  Created by apple on 30/09/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class ATMViewController: UIViewController {

    
        private var previousTextFieldContent: String?
        private var previousSelection: UITextRange?
        @IBOutlet weak var cardNumberLabel: UILabel!
        @IBOutlet weak var enterCardNumberTextField: UITextField!
        @IBOutlet weak var resultLabel: UILabel!
        @IBOutlet weak var textFieldOut: UITextField!
        
        @IBAction func calculateButtonTapped(_ sender: UIButton) {
            
            let stringValue = textFieldOut.text!
            let calc = stringValue.calculate()
            resultLabel.text = String(describing: calc!)
            print(calc!)
        }
        
        @IBAction func textFieldAct(_ sender: UITextField) {
        }
        
        @IBAction func textFieldAction(_ sender: UITextField) {
            cardNumberLabel.text = enterCardNumberTextField.text
        }
        
        // closure
        //    let calculator = { (num1: Int, num2: Int, result: Int) -> Int in
        //           return result
        //       }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            setupToolbar()
            cardNumberLabel.text = "xxxx xxxx xxxx xxxx"
            enterCardNumberTextField.delegate = self
            enterCardNumberTextField.addTarget(self, action: #selector(textFieldAction), for: .allEvents)
            enterCardNumberTextField.addTarget(self, action: #selector(reformatAsCardNumber), for: .editingChanged)
            
        }
        
        func setupToolbar(){
            let bar = UIToolbar()
            let doneBtn = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dismissMyKeyboard))
            let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            bar.items = [flexSpace, flexSpace, doneBtn]
            bar.sizeToFit()
            textFieldOut.inputAccessoryView = bar
            enterCardNumberTextField.inputAccessoryView = bar

            
        }
        @objc func dismissMyKeyboard(){
            view.endEditing(true)
        }
        
        @objc func reformatAsCardNumber(textField: UITextField) {
            var targetCursorPosition = 0
            if let startPosition = textField.selectedTextRange?.start {
                targetCursorPosition = textField.offset(from: textField.beginningOfDocument, to: startPosition)
            }
            
            var cardNumberWithoutSpaces = ""
            if let text = textField.text {
                cardNumberWithoutSpaces = self.removeNonDigits(string: text, andPreserveCursorPosition: &targetCursorPosition)
            }
            
            if cardNumberWithoutSpaces.count > 16 {
                textField.text = previousTextFieldContent
                textField.selectedTextRange = previousSelection
                return
            }
            
            let cardNumberWithSpaces = self.insertSpacesEveryFourDigitsIntoString(string: cardNumberWithoutSpaces, andPreserveCursorPosition: &targetCursorPosition)
            textField.text = cardNumberWithSpaces
            
            if let targetPosition = textField.position(from: textField.beginningOfDocument, offset: targetCursorPosition) {
                textField.selectedTextRange = textField.textRange(from: targetPosition, to: targetPosition)
            }
        }
        
        func removeNonDigits(string: String, andPreserveCursorPosition cursorPosition: inout Int) -> String {
            var digitsOnlyString = ""
            let originalCursorPosition = cursorPosition
            
            for i in Swift.stride(from: 0, to: string.count, by: 1) {
                let characterToAdd = string[string.index(string.startIndex, offsetBy: i)]
                if characterToAdd >= "0" && characterToAdd <= "9" {
                    digitsOnlyString.append(characterToAdd)
                }
                else if i < originalCursorPosition {
                    cursorPosition -= 1
                }
            }
            
            return digitsOnlyString
        }
        
        func insertSpacesEveryFourDigitsIntoString(string: String, andPreserveCursorPosition cursorPosition: inout Int) -> String {
            var stringWithAddedSpaces = ""
            let cursorPositionInSpacelessString = cursorPosition
            
            for i in Swift.stride(from: 0, to: string.count, by: 1) {
                if i > 0 && (i % 4) == 0 {
                    stringWithAddedSpaces.append(contentsOf: " ")
                    if i < cursorPositionInSpacelessString {
                        cursorPosition += 1
                    }
                }
                let characterToAdd = string[string.index(string.startIndex, offsetBy: i)]
                stringWithAddedSpaces.append(characterToAdd)
            }
            
            return stringWithAddedSpaces
        }
        
        
    }

    extension ATMViewController : UITextFieldDelegate {
        
        
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            
            if textField == enterCardNumberTextField {
                previousTextFieldContent = textField.text;
                previousSelection = textField.selectedTextRange;
            }
            
            return true
        }
    }



    // calculator


    extension String {
        
        private func allNumsToDouble() -> String {
            
            let symbolsCharSet = ".,"
            let fullCharSet = "0123456789" + symbolsCharSet
            var i = 0
            var result = ""
            var chars = Array(self)
            while i < chars.count {
                if fullCharSet.contains(chars[i]) {
                    var numString = String(chars[i])
                    i += 1
                    loop: while i < chars.count {
                        if fullCharSet.contains(chars[i]) {
                            numString += String(chars[i])
                            i += 1
                        } else {
                            break loop
                        }
                    }
                    if let num = Double(numString) {
                        result += "\(num)"
                    } else {
                        result += numString
                    }
                } else {
                    result += String(chars[i])
                    i += 1
                }
            }
            return result
        }
        
        func calculate() -> Double? {
            let transformedString = allNumsToDouble()
            let expr = NSExpression(format: transformedString)
            return expr.expressionValue(with: nil, context: nil) as? Double
        }
    }

