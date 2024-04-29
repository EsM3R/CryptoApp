//
//  PortfolioModel.swift
//  CryptoApp
//
//  Created by Mehmet Vural on 26.04.2024.
//

import Foundation
import SwiftData




@Model
class PortfolioModel {
    
    var coinId : String
    var amount : Double
    
    
    init(coinId: String, amount: Double) {
        self.coinId = coinId
        self.amount = amount
    }
}
