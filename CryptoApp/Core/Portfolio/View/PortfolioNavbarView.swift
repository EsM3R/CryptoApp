//
//  PortfolioNavbarView.swift
//  CryptoApp
//
//  Created by Mehmet Vural on 12.04.2024.
//

import SwiftUI

struct PortfolioNavbarView: View {
    
    @Environment(\.modelContext) var modelContext
    @Environment(HomeViewModel.self) private var homeViewModel
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
        
//        guard let selectedCoin else {return}
    
        withAnimation {
            showCheckmark = true
            removeSelectionCoin()
        }
            
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            showCheckmark = false
        }
        
    }
    private func removeSelectionCoin(){
        selectedCoin =  nil
        homeViewModel.searchText = ""
        
    }
}
