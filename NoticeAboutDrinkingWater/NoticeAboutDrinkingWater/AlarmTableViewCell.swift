//
//  AlarmTableViewCell.swift
//  NoticeAboutDrinkingWater
//
//  Created by JOOMINKYUNG on 2023/02/25.
//

import UIKit

class AlarmTableViewCell: UITableViewCell {

    @IBOutlet weak var alarmClockLabel: UILabel!
    @IBOutlet weak var onOffAlarmSwitch: UISwitch!
    @IBOutlet weak var AmPmLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
}


