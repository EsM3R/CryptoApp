//
//  HomeView.swift
//  CryptoApp
//
//  Created by Mehmet Vural on 13.03.2024.
//

import SwiftUI

struct HomeView : View {
    
    @Environment(HomeViewModel.self) private var homeViewModel
    
    @State private var showPortfolio : Bool = false
    
    
    var body: some View {
    
        NavigationStack {
            ZStack{
                Theme.color.backgroundColor.ignoresSafeArea()
                
                VStack{
                    
                    NavbarView(isShowPortfolio: $showPortfolio)
                        .padding(.horizontal)
                    
                    HomeStatsView(showPortfolio: $showPortfolio)
                        .padding(.horizontal)
                    
                    SearchBarView()
                        .padding(.horizontal)
                        .padding(.horizontal)
                    
                    
                    Spacer()
                    
                    SubHeaderView(showPortfolio: $showPortfolio)
                        .padding(.horizontal)
                        .padding(.horizontal)
                    
                    
                    
                    if !showPortfolio{
                        AllCoinListView()
                            .transition(.move(edge: .leading))
                    }
                    if showPortfolio{
                        PortfolioCoinListView()
                            .transition(.move(edge: .trailing))
                    }
                    
                    Spacer()
                    
                }
                .navigationDestination(for: CoinModel.self) { coin  in
                    DetailView(coin: coin)
                }
            }
            
        }

    }
}

#Preview {
    ContentView()
}
