//
//  SubHeaderView.swift
//  CryptoApp
//
//  Created by Mehmet Vural on 12.04.2024.
//

import SwiftUI

struct SubHeaderView: View {
    
    @Environment(HomeViewModel.self) private var homeViewModel
    @Binding var showPortfolio : Bool
    
    
    private let coinText : String = "Coin"
    private let priceText : String = "Price"
    private let holdingText  : String = "Holdings"
    
    var body: some View {
        
        HStack{
            
            Text(coinText)
                .frame(width: UIScreen.main.bounds.width / 3.5 ,
                       alignment: .leading)
            
            
            Spacer()
            
            if showPortfolio{
                Text(holdingText)
                    .frame(width: UIScreen.main.bounds.width / 3.5 ,
                           alignment: .leading)
                
            }
            
            Text(priceText)
                

            
        }
        .font(.caption)
        .foregroundStyle(Theme.color.secondaryColor)
    }
}
#Preview {
    SubHeaderView(showPortfolio: .constant(true))
}
