//
//  CoinRowView.swift
//  CryptoApp
//
//  Created by Mehmet Vural on 19.03.2024.
//

import SwiftUI

struct CoinRowView: View {
    
    let coin : CoinModel
    
    @State var isShowHoldingColumn : Bool = true
    
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

#Preview {
    CoinRowView(coin: DeveloperPreview.instance.coin)
}


extension CoinRowView {
    
    private var leftColumn : some View{
        HStack{
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundStyle(Color.theme.secondary)
                .frame(minWidth: 30)
            
            Circle()
                .frame(width: 30, height: 30)
            
            Text("\(coin.symbol.uppercased())")
                .font(.headline)
                .foregroundStyle(Color.theme.accent)
        }
 
    }
    private var centerColumn : some View {
        VStack(alignment: .leading){
            Text(coin.currentHoldingsValue.asCurrencyWithDecimal())
                .bold()
            Text(coin.currentHoldings?.asPercentSrting() ?? "")
            
        }
        .foregroundStyle(Color.theme.accent)
    }
    
    private var rightColumn : some View{
        
        VStack(alignment: .trailing){
            
            Text(coin.currentPrice.asCurrencyWithDecimal())
                .bold()
                
            
            Text(coin.priceChangePercentage24H?.asPercentSrting() ?? "")
                .foregroundStyle(
                    coin.priceChangePercentage24H ?? 0 >= 0 ?
                    Color.green : Color.red)
        }
        .frame(width: UIScreen.main.bounds.width / 3.5  , alignment: .trailing)

    }
}
