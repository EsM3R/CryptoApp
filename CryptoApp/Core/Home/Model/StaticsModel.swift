//
//  StatisticModel.swift
//  CryptoApp
//
//  Created by Mehmet Vural on 1.04.2024.
//

import Foundation


struct  StatisticModel : Identifiable  {
    
    let id  : String  = UUID().uuidString
    let title : String
    let value : String
    let percentChanges : Double?
    
    init(title: String, value: String, percentChanges: Double?  = nil) {
        self.title = title
        self.value = value
        self.percentChanges = percentChanges
    }
}


