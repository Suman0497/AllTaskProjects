//
//  MyPasswordUIValidation.swift
//  Passcode App
//
//  Created by apple on 11/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit
import SmileLock

class MyPasswordModel {
    class func match(_ password: String) -> MyPasswordModel? {
        guard password == "1234" else { return nil }
        return MyPasswordModel()
    }
}

class MyPasswordUIValidation: PasswordUIValidation<MyPasswordModel> {
    init(in stackView: UIStackView) {
        super.init(in: stackView, digit: 4)
        validation = { password in
            MyPasswordModel.match(password)
        }
    }
    
    //handle Touch ID
    override func touchAuthenticationComplete(_ passwordContainerView: PasswordContainerView, success: Bool, error: Error?) {
        if success {
            let dummyModel = MyPasswordModel()
            self.success?(dummyModel)
        } else {
            passwordContainerView.clearInput()
        }
    }
}
