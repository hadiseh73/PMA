//
//  CurrencyModel.swift
//  PMA
//
//  Created by HadisehSafaei on 5/17/1402 AP.
//


import Foundation

struct CurrencyModel: Decodable{
    
    let result: String?
    let documentation: String?
    let terms_of_use: String?
    let time_last_update_unix: Int?
    let time_last_update_utc: String?
    let time_next_update_unix: Int?
    let time_next_update_utc: String?
    let base_code: String?
    let conversion_rates: [String:Double]?
}
