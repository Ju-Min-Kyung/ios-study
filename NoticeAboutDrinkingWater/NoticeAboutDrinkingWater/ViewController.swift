//
//  ViewController.swift
//  NoticeAboutDrinkingWater
//
//  Created by JOOMINKYUNG on 2023/02/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var alarmList = [Alarm](){
        didSet {
            self.saveAlarmList()
        }
    }
    var isAm : Bool?
    var clock : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        loadAlaramList()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "AlarmTableViewCell", bundle: nil), forCellReuseIdentifier: "alarmCell")
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSetVc" {
            guard let viewController: AddAlarmViewController = segue.destination as? AddAlarmViewController else { return }
            viewController.delegate = self
            
            
        }
    }
    
    //using Userdefaults
    func saveAlarmList(){
        let time = self.alarmList.map{
            [
                "isOn" : $0.isOn,
                "isAm" : $0.isAm,
                "clock" : $0.clock
            
            ]
        }
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(time, forKey: "alarmList")
    }
    func loadAlaramList(){
        
        let userDefaults = UserDefaults.standard
        
        guard let data = userDefaults.object(forKey: "alarmList") as? [[String: Any]] else {return}
        self.alarmList = data.compactMap {
            guard let isOn = $0["isOn"] as? Bool else {return nil}
            guard let isAm = $0["isAm"] as? Bool else {return nil }
            guard let clock = $0["clock"] as? Date else {return nil}
            return Alarm(isOn: isOn, isAm: isAm, clock: clock)
        }
        
        
        self.alarmList = self.alarmList.sorted(by: {
            $0.clock.compare($1.clock) == .orderedAscending
        })
    }
    
    
    // DateFormatter
    func changeDatepickerToString(date : Date) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        return dateFormatter.string(from: date)
        
    }
    
    func isAmPm(date  : Date) -> Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "aa"
        dateFormatter.locale = Locale(identifier: "Ko_KR")
        
        return dateFormatter.string(from: date) == "오전" ? true : false
        
    }
    


}

extension ViewController : AlarmInformationDelegate{
    func sendInformation(clock: Date) {

        self.isAm = isAmPm(date: clock)
        alarmList.append(Alarm(isOn: true, isAm: isAm ?? false, clock: clock ))
        tableView.reloadData()
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alarmList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "alarmCell", for: indexPath) as? AlarmTableViewCell else {
            return UITableViewCell()
            
        }
        
        cell.AmPmLabel.text = alarmList[indexPath.row].isAm == true ? "오전" : "오후"
        cell.alarmClockLabel.text = changeDatepickerToString(date: alarmList[indexPath.row].clock )
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        self.alarmList.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    
}
