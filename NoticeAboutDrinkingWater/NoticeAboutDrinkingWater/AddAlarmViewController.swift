//
//  AddAlarmViewController.swift
//  NoticeAboutDrinkingWater
//
//  Created by JOOMINKYUNG on 2023/02/25.
//

import Foundation
import UIKit


protocol AlarmInformationDelegate {
    func sendInformation(clock : Date)
}

class AddAlarmViewController: UIViewController{
    
    @IBOutlet weak var datePicker: UIDatePicker!

    var delegate : AlarmInformationDelegate?
    var clock : Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    


    @IBAction func setAlarm(_ sender: Any) {
        
      
      
        let date = datePicker.date
        let timezone = TimeZone.autoupdatingCurrent
        
        let secondsFromGMT = timezone.secondsFromGMT(for: date)
        let localizedDate = date.addingTimeInterval(TimeInterval(secondsFromGMT))
        
        delegate?.sendInformation(clock: localizedDate )

        self.dismiss(animated: true)
        
    }
    @IBAction func cancelAlarm(_ sender: Any) {
        
        self.dismiss(animated: true)
    }
    
}


extension Date {

    var localizedDate : Date {

        let date = Date()
        let timezone = TimeZone.autoupdatingCurrent
        
        let secondsFromGMT = timezone.secondsFromGMT(for: date)
        let localizedDate = date.addingTimeInterval(TimeInterval(secondsFromGMT))

        return localizedDate;
    }
}
