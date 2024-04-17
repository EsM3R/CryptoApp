//
//  SubHeaderView.swift
//  CryptoApp
//
//  Created by Mehmet Vural on 12.04.2024.
//

import SwiftUI

struct SubHeaderView: View {
    
    @Binding var showPortfolio : Bool
    private let coinText : String = "Coin"
    private let priceText : String = "Price"
    private let holdingText  : String = "Holdings"
    var body: some View {
        
        HStack{
            
            Text(coinText)
            
            Spacer()
            
            if showPortfolio{
                Text(holdingText)
            }
          
            Text(priceText)
                .frame(width: UIScreen.main.bounds.width / 3.5 ,
                       alignment: .trailing)
        }
        .font(.caption)
        .foregroundStyle(Color.theme.secondary)
    }
}

#Preview {
    SubHeaderView(showPortfolio: .constant(true))
}
