//
//  HomeStatsView.swift
//  CryptoApp
//
//  Created by Mehmet Vural on 2.04.2024.
//

import SwiftUI

struct HomeStatsView: View {
    
    @Environment(HomeViewModel.self) private var homeViewModel
    
    @Binding var showPortfolio : Bool
    
    var body: some View {
        HStack{
            
            ForEach(homeViewModel.stats) { stat in
                StatisticView(stat: stat)
                    .frame(width: UIScreen.main.bounds.width / 3)
            }
        }
        .frame(width:  UIScreen.main.bounds.width,
               alignment: showPortfolio ? .trailing : .leading)
    }
}

#Preview {
    HomeStatsView(showPortfolio: .constant(true))
}
