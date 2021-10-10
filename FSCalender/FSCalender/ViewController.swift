//
//  ViewController.swift
//  FSCalender
//
//  Created by apple on 10/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit
import FSCalendar

class ViewController: UIViewController {

    @IBOutlet weak var datelabel: UILabel!
    var calendar = FSCalendar()
    var formatter = DateFormatter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendar = FSCalendar(frame: CGRect(x: 0.0, y: 40.0, width: self.view.frame.size.width, height: 300.0))
        calendar.scrollDirection = .vertical
       // calendar.scope = .week
       // calendar.scope = .month
        //calendar.locale = Locale(identifier: "hi") hindi ar-arabic
        
        self.view.addSubview(calendar)
        calendar.dataSource = self
        calendar.delegate = self
    }
}
//MARK:- delegate

extension ViewController:FSCalendarDelegate{
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        formatter.dateFormat = "dd-MM-yyyy"
        datelabel.text = "Date selected == \(formatter.string(from: date))"
        print("Date selected == \(formatter.string(from: date))")
    }
}

//MARK:- DataSource
extension ViewController: FSCalendarDataSource{
//    func minimumDate(for calendar: FSCalendar) -> Date {
//        return Date()
//    }
//    func maximumDate(for calendar: FSCalendar) -> Date {
//        return Date().addingTimeInterval((24*60*60)*5)
//    }
}
