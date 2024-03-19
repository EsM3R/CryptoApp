//
//  HomeView.swift
//  CryptoApp
//
//  Created by Mehmet Vural on 13.03.2024.
//

import SwiftUI

struct HomeView : View {
    
    @State private var isShowPortfolio : Bool = false
    
    @State private var value : Double =  0
    
    var body: some View {
        
        ZStack{
            Color.theme.background
            VStack{
                
                NavbarView(isShowPortfolio: $isShowPortfolio)
                
                ForEach(1 ... 10 , id : \.self){_ in
                    CoinRowView(coin: DeveloperPreview.instance.coin)
                        .padding(5)
                }
                
               
               
                Spacer()
            }
        }
    }
}

#Preview {
    HomeView()
}
