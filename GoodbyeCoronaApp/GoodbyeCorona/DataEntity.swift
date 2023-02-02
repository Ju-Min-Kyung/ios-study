//
//  DataEntity.swift
//  GoodbyeCorona
//
//  Created by JOOMINKYUNG on 2023/01/30.
//

import Foundation

struct Entity : Codable{
    let korea : detailEntity
    let seoul : detailEntity
    let busan : detailEntity
    let daegu : detailEntity
    let incheon : detailEntity
    let gwangju : detailEntity
    let daejeon : detailEntity
    let ulsan : detailEntity
    let sejong : detailEntity
    let gangwon : detailEntity
    let gyeonggi : detailEntity
    let chungbuk : detailEntity
    let chungnam : detailEntity
    let jeonbuk : detailEntity
    let jeonnam : detailEntity
    let gyeongbuk : detailEntity
    let gyeongnam : detailEntity
    let jeju : detailEntity
    
}
struct detailEntity : Codable{
    let countryNm : String
    let totalCnt : Int
    let deathCnt : Int
    let qurRate: Int
    let incDec : Int
    let incDecK : Int
    let incDecF : Int
}
