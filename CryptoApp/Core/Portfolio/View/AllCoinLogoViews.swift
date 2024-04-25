//
//  AllCoinLogoViews.swift
//  CryptoApp
//
//  Created by Mehmet Vural on 12.04.2024.
//

import SwiftUI

struct AllCoinLogoViews: View {
    
    @Environment(HomeViewModel.self) var homeViewModel
    @Binding var selectedCoin : CoinModel?
    var body: some View {
        
        ScrollView(.horizontal , showsIndicators: false) {
            
            LazyHStack{
                
                ForEach(homeViewModel.allCoins) { coin in
                    CoinLogoView(selectedCoin: $selectedCoin, 
                                 coin: coin)
                        .onTapGesture {
                            self.selectedCoin = coin
                        }
                    
                }
                
            }
        }
    }
}

