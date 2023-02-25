//
//  AddAlarmViewController.swift
//  NoticeAboutDrinkingWater
//
//  Created by JOOMINKYUNG on 2023/02/25.
//

import Foundation
import UIKit


protocol AlarmInformationDelegate {
    func sendInformation(isAm : Bool, clock : String)
}

class AddAlarmViewController: UIViewController{
    
    @IBOutlet weak var datePicker: UIDatePicker!

    var delegate : AlarmInformationDelegate?
    var isAm : Bool?
    var clock : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func changeDatepickerToString(date : Date) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:MM"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        return dateFormatter.string(from: date)
        
    }
    
    func isAmPm(date  : Date) -> Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "aa"
        dateFormatter.locale = Locale(identifier: "Ko_KR")
        
        return dateFormatter.string(from: date) == "오전" ? true : false
        
    }

    @IBAction func setAlarm(_ sender: Any) {
        
        isAm = isAmPm(date: datePicker.date)
        clock = changeDatepickerToString(date: datePicker.date)
        
        delegate?.sendInformation(isAm: isAm ?? true, clock: clock ?? "")

        self.dismiss(animated: true)
        
    }
    @IBAction func cancelAlarm(_ sender: Any) {
        
        self.dismiss(animated: true)
    }
    
}
