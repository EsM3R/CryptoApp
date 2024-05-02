//
//  AllCoinListView.swift
//  CryptoApp
//
//  Created by Mehmet Vural on 12.04.2024.
//

import SwiftUI

struct AllCoinListView: View {
    
    @Environment(HomeViewModel.self) private var homeViewModel
    
    var body: some View {
        List{
      
            ForEach(homeViewModel.allCoins){ coin in
                
                NavigationLink(value: coin) {
                    CoinRowView(coin : coin,isShowHoldingColumn: false)
                                    
                }
            
            }
            
        }
        .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
        .listStyle(.plain)
    }
}


