//
//  PortfolioCoinListView.swift
//  CryptoApp
//
//  Created by Mehmet Vural on 12.04.2024.
//

import SwiftUI

struct PortfolioCoinListView: View {
    
    @EnvironmentObject private var homeViewModel : HomeViewModel
    
    var body: some View {
        List{
            ForEach(homeViewModel.portfolioCoins){ coin in
                CoinRowView(coin: coin)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 20))
                   
                
            }
        }
        .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
        .listStyle(.plain)
    }
}

#Preview {
    PortfolioCoinListView()
}
