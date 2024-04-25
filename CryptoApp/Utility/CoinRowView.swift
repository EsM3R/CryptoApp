//
//  CoinRowView.swift
//  CryptoApp
//
//  Created by Mehmet Vural on 19.03.2024.
//

import SwiftUI
 

struct CoinRowView: View {
    
    var isShowHoldingColumn : Bool = true
    let coin : CoinModel
    let amount : Double?
    
    init(coin: CoinModel, amount: Double? =  nil  , isShowHoldingColumn : Bool  = true) {
        self.coin = coin
        self.amount = amount
        self.isShowHoldingColumn = isShowHoldingColumn
        
    }
    
 
    
    var body: some View {
        HStack(spacing : 0){
            
            leftColumn
    
            Spacer()
    
            if isShowHoldingColumn{
                centerColumn
            }
            
            rightColumn
        }
        .font(.subheadline)
    }
}

extension CoinRowView {
    
    private var leftColumn : some View{
        HStack(spacing : 6){
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundStyle(Theme.color.secondaryColor)
                .frame(minWidth: 30)
            
            AsyncImageForCoin(url: coin.image, circleImageSize: 30)
            
            
            Text("\(coin.symbol.uppercased())")
                .font(.headline)
                .foregroundStyle(Theme.color.accentColor)
        }
 
    }
    private var centerColumn : some View {
        VStack(alignment: .leading){
            Text(coin.currentHoldingsValue.asCurrencyWith2Decimals())
                .bold()
            Text(coin.currentHoldings?.asPercentString() ?? "")
            
        }
        .foregroundStyle(Theme.color.accentColor)
    }
    
    private var rightColumn : some View{
        
        VStack(alignment: .trailing){
            
            Text(coin.currentPrice.asCurrencyWith2Decimals())
                .bold()
                
            
            Text(coin.priceChangePercentage24H?.asPercentString() ?? "")
                .foregroundStyle(
                    coin.priceChangePercentage24H ?? 0 >= 0 ?
                    Color.green : Color.red)
        }
        .frame(width: UIScreen.main.bounds.width / 3.5  , alignment: .trailing)

    }
}
