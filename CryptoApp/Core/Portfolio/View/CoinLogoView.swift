//
//  CoinLogoView.swift
//  CryptoApp
//
//  Created by Mehmet Vural on 6.04.2024.
//

import SwiftUI

struct CoinLogoView: View {

    @Binding var selectedCoin : CoinModel?
    
    let coin : CoinModel
    
    var body: some View {
        
        VStack(alignment: .center, spacing: nil) {
            
            AsyncImageForCoin(url: coin.image, circleImageSize: 80)
            
            Text(coin.symbol.uppercased())
                .font(.title2)
                .foregroundStyle(Color.theme.accent)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
            
            Text(coin.name)
                .font(.headline)
                .foregroundStyle(Color.theme.secondary)
                .lineLimit(2)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
        }
        .frame(width: 100)
        .padding(5)
        .background {
            RoundedRectangle(cornerRadius: 8).stroke(
                    selectedCoin?.id == coin.id ?
                    Color.theme.green : Color.clear ,lineWidth: 2)
        }
        
        
    }
}


