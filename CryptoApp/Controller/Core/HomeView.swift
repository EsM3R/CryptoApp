//
//  HomeView.swift
//  CryptoApp
//
//  Created by Mehmet Vural on 13.03.2024.
//

import SwiftUI

struct HomeView : View {
    
    @EnvironmentObject var homeViewModel : HomeViewModel
    
    @State private var showPortfolio : Bool = false

    
    var body: some View {
        
        ZStack{
            
            Color.theme.background.ignoresSafeArea()
           
            VStack{
                
                NavbarView(isShowPortfolio: $showPortfolio)
 
                SearchBarView(searchText: $homeViewModel.searchText)
                
                Spacer()
                
                subHeader
                
                if !showPortfolio{
                    allCoinsList
                        .transition(.move(edge: .leading))
                }
                if showPortfolio{
                    portfolioCoinsList
                        .transition(.move(edge: .trailing))
                }
                
                Spacer()
            
            }
        }
    }
}

#Preview {
    ContentView()
}

extension HomeView{
    
    private var allCoinsList : some View{
        List{
            ForEach(homeViewModel.allCoins){ coin in
                CoinRowView(coin: coin,isShowHoldingColumn: false)
                  
                    
                
            }
            
        }
        .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
        .listStyle(.plain)
    }
    
    private var portfolioCoinsList : some View{
        List{
            ForEach(homeViewModel.portfolioCoins){ coin in
                CoinRowView(coin: coin)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
                   
                
            }
        }
        .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
        .listStyle(.plain)
    }
    
    private var subHeader : some View {
        HStack{
            Text("Coin")
            Spacer()
            if showPortfolio{
                Text("Holdings")
            }
          
            Text("Price")
                .frame(width: UIScreen.main.bounds.width / 3.5  , alignment: .trailing)
        }
        .font(.caption)
        .foregroundStyle(Color.theme.secondary)
        .padding(.horizontal)
        .padding()

    }
}
