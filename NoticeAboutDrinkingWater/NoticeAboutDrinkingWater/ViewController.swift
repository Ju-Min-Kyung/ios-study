//
//  ViewController.swift
//  NoticeAboutDrinkingWater
//
//  Created by JOOMINKYUNG on 2023/02/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var alarmList : [Alarm] = []
    var isAm : Bool?
    var clock : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
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
    
    


}

extension ViewController : AlarmInformationDelegate{
    func sendInformation(isAm: Bool, clock: String) {
        self.isAm = isAm
        self.clock = clock
        
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
        
        
        tableView.reloadData()
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


