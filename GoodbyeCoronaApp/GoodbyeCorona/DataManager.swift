//
//  DataManager.swift
//  GoodbyeCorona
//
//  Created by JOOMINKYUNG on 2023/01/30.
//

import Foundation
import Alamofire

class DataManager{
    
    func getData(viewController : ViewController){
        let url = "https://api.corona-19.kr/korea/?serviceKey=iwQMEGuJRH7L9bDldayNCmUfTogrkY62V"
        
        let request = AF.request(url, method: .get).validate(statusCode: 200..<400)
        request.responseDecodable(of: Entity.self) { response in
            debugPrint(response)
            switch response.result {
            case .success(let data):
                viewController.success(data: data)
            case .failure(_):
                viewController.failure(error: "서버와의 연결이 원활하지 않습니다")
            }
        }
        
    }
}
