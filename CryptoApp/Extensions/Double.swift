//
//  Double.swift
//  CryptoApp
//
//  Created by Mehmet Vural on 19.03.2024.
//

import Foundation


extension Double{
    
    private var currencyFormatter : NumberFormatter {
        
        let formatter = NumberFormatter()
        
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency

        formatter.currencySymbol = "$"
        
        
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }
    
    
    func asCurrencyWithDecimal() -> String {
        
        let number = NSNumber(value:  self)
        
        return currencyFormatter.string(from: number) ??  "0.000"

    }
    
    func asNumberString() -> String {
        return String(format: "%.2F", self)
    }
    
    func asPercentSrting() -> String {
        return "\(asNumberString())%"
    }
}
