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
        
        clock = datePicker.date
        
        delegate?.sendInformation(clock: clock! )

        self.dismiss(animated: true)
        
    }
    @IBAction func cancelAlarm(_ sender: Any) {
        
        self.dismiss(animated: true)
    }
    
}
