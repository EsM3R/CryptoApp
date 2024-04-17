//
//  PortfolioInputView.swift
//  CryptoApp
//
//  Created by Mehmet Vural on 12.04.2024.
//

import SwiftUI

struct PortfolioInputView: View {
    
    var selectedCoin : CoinModel
    @Binding var quantityText : String
    
    private func getCurrentValue() ->  Double{
        if let quantity = Double(quantityText){
            return quantity * (selectedCoin.currentPrice )
        }
        return 0
    }
    
    var body: some View {
        
        VStack(spacing : 20){
            HStack{
                
                Text("Current price of \(selectedCoin.symbol.uppercased()) :")
                
                Spacer()
                
                Text(selectedCoin.currentPrice.asCurrencyWith6Decimals())
            }
            Divider()
            HStack{
                Text("Amount in your portfolio:")
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                Spacer()
                TextField("Ex : 1.4", text: $quantityText)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.decimalPad)
            }
            
            Divider()
            HStack{
                Text("Current Value:")
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                Spacer()
                Text(getCurrentValue().asCurrencyWith6Decimals())
            }
            
        }
        .fontWeight(.semibold)
        .font(.headline)
    }
}

