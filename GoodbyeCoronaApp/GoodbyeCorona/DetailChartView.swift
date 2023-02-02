//
//  DetailChartView.swift
//  GoodbyeCorona
//
//  Created by JOOMINKYUNG on 2023/01/31.
//

import Foundation
import UIKit

class DetailChartView: UIViewController{
    

    @IBOutlet weak var tableview: UITableView!
   
    var dataSet : detailEntity?
    var numbersArray : [Int]?
    let titleArray : [String] = ["신규 확진자", "확진자" , "사망자", "발생율", "해외유입 신규 확진자", "지역발생 신규 확진자"]
    override func viewDidLoad() {
        self.tableview.delegate = self
        self.tableview.dataSource = self
        numbersArray = [dataSet?.incDec ?? 0, dataSet?.totalCnt ?? 0, dataSet?.deathCnt ?? 0, dataSet?.qurRate ?? 0, dataSet?.incDecF ?? 0, dataSet?.incDecK ?? 0]
    
        super.viewDidLoad()
    }
    
    private func makeComma(numbers : Int) -> String {
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        let result : String = numberFormatter.string(for : numbers)!
        return result
    }
    
   
}

extension DetailChartView : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        guard let cell = self.tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell else {return UITableViewCell()}
        cell.titleLabel.text = titleArray[indexPath.row]
        cell.numberLabel.text = "\(makeComma(numbers: numbersArray![indexPath.row]))명"
     
        return cell
    }
    
    
}
