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
                    .padding(.horizontal)
                
                HomeStatsView(showPortfolio: $showPortfolio)
                    .padding(.horizontal)
                
                SearchBarView(searchText: $homeViewModel.searchText)
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
        }
    }
}

#Preview {
    ContentView()
}
