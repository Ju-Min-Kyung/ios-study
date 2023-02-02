//
//  ViewController.swift
//  GoodbyeCorona
//
//  Created by JOOMINKYUNG on 2023/01/30.
//

import UIKit
import Charts

class ViewController: UIViewController {

   
    @IBOutlet weak var pieChartView: PieChartView!
    @IBOutlet weak var newCases: UILabel!
    @IBOutlet weak var cumulativeCases: UILabel!
    var citiesData : Entity?
    let cityData : [String] = ["서울", "부산", "대구", "인천", "광주", "대전", "울산", "세종", "강원", "경기", "충북", "충남", "전북", "전남", "경남", "경북", "제주"]
    var peopleData : [Int]?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.pieChartView.delegate = self
        let dataManager = DataManager()
        dataManager.getData(viewController: self)
      
        
    }
    
    func setChart(dataPoints: [String], values: [Int]){
        var dataEntries : [ChartDataEntry] = []
        for i in 0..<dataPoints.count {
            let dataEntry = PieChartDataEntry(value: Double(values[i]), label: dataPoints[i], data:  dataPoints[i] as AnyObject)
                dataEntries.append(dataEntry)
              }
        
        // 2. Set ChartDataSet
                let pieChartDataSet = PieChartDataSet(entries: dataEntries )
              pieChartDataSet.colors = colorsOfCharts(numbersOfColor: dataPoints.count)
              
              // 3. Set ChartData
              let pieChartData = PieChartData(dataSet: pieChartDataSet)
              let format = NumberFormatter()
              format.numberStyle = .none
              let formatter = DefaultValueFormatter(formatter: format)
              pieChartData.setValueFormatter(formatter)
              
              // 4. Assign it to the chart's data
              pieChartView.data = pieChartData
            }
        
    private func colorsOfCharts(numbersOfColor: Int) -> [UIColor] {
         var colors: [UIColor] = []
         for _ in 0..<numbersOfColor {
           let red = Double(arc4random_uniform(256))
           let green = Double(arc4random_uniform(256))
           let blue = Double(arc4random_uniform(256))
           let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
           colors.append(color)
         }
         return colors
       }


    private func configureLabels(){
        cumulativeCases.text = "\(makeComma(numbers: citiesData?.korea.totalCnt ?? 0)) 명"
        newCases.text = "\(makeComma(numbers: citiesData?.korea.incDec ?? 0)) 명"
    }

    private func makeComma(numbers : Int) -> String {
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        let result : String = numberFormatter.string(for : numbers)!
        return result
    }
    
    func success(data : Entity){
        citiesData = data
        peopleData = [
            citiesData!.seoul.incDec,
            citiesData!.busan.incDec,
            citiesData!.daegu.incDec,
            citiesData!.incheon.incDec,
            citiesData!.gwangju.incDec,
            citiesData!.daejeon.incDec,
            citiesData!.ulsan.incDec,
            citiesData!.sejong.incDec,
            citiesData!.gangwon.incDec,
            citiesData!.gyeonggi.incDec,
            citiesData!.chungbuk.incDec,
            citiesData!.chungnam.incDec,
            citiesData!.jeonbuk.incDec,
            citiesData!.jeonnam.incDec,
            citiesData!.gyeongnam.incDec,
            citiesData!.gyeongbuk.incDec,
            citiesData!.jeju.incDec
            
        ]
        setChart(dataPoints: cityData, values: peopleData!)
        configureLabels()
        
       
        
    }
    
    
    
    
    func failure(error : String){
        let alert = UIAlertController(title: "에러", message: error, preferredStyle: .alert)
        let checkAction = UIAlertAction(title: "확인", style: .default, handler: {_ in
            alert.dismiss(animated: true)
        })
        alert.addAction(checkAction)
        self.present(alert, animated: true)
    }


}


extension ViewController : ChartViewDelegate{
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
       print("asdas")
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "detailView") as? DetailChartView else {return}
        
        if citiesData != nil {
        
            guard let data = entry.data as? String else {return}
            switch(data){
            case "서울" :
                vc.dataSet = citiesData?.seoul
            case "부산" :
                vc.dataSet = citiesData?.busan
            case "대구" :
                vc.dataSet = citiesData?.busan
            case "인천" :
                vc.dataSet = citiesData?.busan
            case "광주" :
                vc.dataSet = citiesData?.busan
            case "대전" :
                vc.dataSet = citiesData?.busan
            case "울산" :
                vc.dataSet = citiesData?.busan
            case "세종" :
                vc.dataSet = citiesData?.busan
            case "강원" :
                vc.dataSet = citiesData?.busan
            case "경기" :
                vc.dataSet = citiesData?.busan
            case "충북" :
                vc.dataSet = citiesData?.busan
            case "충남" :
                vc.dataSet = citiesData?.busan
            case "전북" :
                vc.dataSet = citiesData?.busan
            case "전남" :
                vc.dataSet = citiesData?.busan
            case "경북" :
                vc.dataSet = citiesData?.busan
            case "경남" :
                vc.dataSet = citiesData?.busan
            case "제주" :
                vc.dataSet = citiesData?.busan
            default :
                vc.dataSet = citiesData?.busan
            }
           
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
