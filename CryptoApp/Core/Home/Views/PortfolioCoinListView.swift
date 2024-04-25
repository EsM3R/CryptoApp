//
//  PortfolioCoinListView.swift
//  CryptoApp
//
//  Created by Mehmet Vural on 12.04.2024.
//

import SwiftUI


struct PortfolioCoinListView: View {
    
    @Environment(HomeViewModel.self) private var homeViewModel

    var body: some View {
        List{
            
        }
        .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
        .listStyle(.plain)
    }
}

#Preview {
    ContentView()
}
