//
//  ChartView.swift
//  CryptoApp
//
//  Created by Mehmet Vural on 2.05.2024.
//

import SwiftUI
import SwiftUICharts


struct ChartView: View {
    
    var coin : CoinModel?
    
    var body: some View {
        VStack(){
            LineView(data: coin?.sparklineIn7D?.price ?? [0] , title: "\(coin?.name ?? "")", legend: "7DPrice")
                
        }
        .frame(height: 330)

   
    
    }
}

#Preview {
    ContentView()
}
