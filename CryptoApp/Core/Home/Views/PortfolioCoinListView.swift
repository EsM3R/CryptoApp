//
//  PortfolioCoinListView.swift
//  CryptoApp
//
//  Created by Mehmet Vural on 12.04.2024.
//

import SwiftUI
import SwiftData


struct PortfolioCoinListView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Environment(HomeViewModel.self) private var homeViewModel
    @Environment(PortfolioViewModel.self) private var portfolioViewModel
    
    var body: some View {
        List{
            ForEach(portfolioViewModel.portfolioCoins) { portfolioCoin in
                
                let coin = self.homeViewModel.getCoinById(portfolioModel: portfolioCoin)
                
                CoinRowView(coin: coin, amount: portfolioCoin.amount)
                
            }
            .onDelete(perform: self.portfolioViewModel.deletePortfolio)
            
        }
        .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
        .listStyle(.plain)
        .onAppear{
         
            portfolioViewModel.modelContext = self.modelContext
        }
    }
    
}

#Preview {
    ContentView()
}
