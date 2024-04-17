//
//  PortfolioView.swift
//  CryptoApp
//
//  Created by Mehmet Vural on 6.04.2024.
//

import SwiftUI

struct PortfolioView: View {
    
    @EnvironmentObject private var homeViewModel : HomeViewModel
    @State private var selectedCoin : CoinModel? = nil
    @State private var quantityText : String = ""

    
    var body: some View {
        ScrollView {
            
            VStack(alignment : .leading , spacing : 15) {
                
                PortfolioNavbarView(selectedCoin: $selectedCoin,
                                    quantityText: $quantityText)
                
                TitleView()
                
                SearchBarView(searchText: $homeViewModel.searchText)
                
                AllCoinLogoViews(selectedCoin: $selectedCoin)
                
                                 
                if let selectedCoin {
                    PortfolioInputView(selectedCoin: selectedCoin,
                                       quantityText: $quantityText)
                }
                
                
            }

        }
        .padding(.horizontal)

    }

}



#Preview {
    ContentView()
}
