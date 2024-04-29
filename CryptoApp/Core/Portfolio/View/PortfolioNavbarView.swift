//
//  PortfolioNavbarView.swift
//  CryptoApp
//
//  Created by Mehmet Vural on 12.04.2024.
//

import SwiftUI

struct PortfolioNavbarView: View {
    
    @Environment(HomeViewModel.self) private var homeViewModel
    @Environment(PortfolioViewModel.self) private var portfolioViewModel
    @State private var showCheckmark : Bool = false
    @Binding  var selectedCoin : CoinModel?
    @Binding  var quantityText : String
    
    
    var body: some View {
        HStack{
            
            XMarkButton()
                .frame(alignment: .leading)
            
            Spacer()
            
            HStack{
             
                Image(systemName: "checkmark")
                    .opacity(showCheckmark ? 1.0 : 0.0)
                
                Button("Save") {
                    saveButtonPressed()
                }
                .opacity(selectedCoin != nil && 
                         selectedCoin?.currentHoldings != Double(quantityText) ?
                         1.0 : 0.0)
            }
        
        }
    }
    
    private func saveButtonPressed(){

        withAnimation {
            showCheckmark = true
            addPortfolio()
            removeSelectionCoin()
        }
            
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            showCheckmark = false
        }
        
    }
    
    private func addPortfolio(){
        
        guard let selectedCoin = selectedCoin else {return}
        guard let amount = Double(quantityText) else { return }
        
        portfolioViewModel.updatePortfolio(coin: selectedCoin, amount: amount)
        homeViewModel.calcualatePortfolioValue(portfolioCoins: portfolioViewModel.portfolioCoins)
    
    }
    
    private func removeSelectionCoin(){
        selectedCoin =  nil
        homeViewModel.searchText = ""
        
    }
}
