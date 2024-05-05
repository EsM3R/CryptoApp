//
//  DetailView.swift
//  CryptoApp
//
//  Created by Mehmet Vural on 30.04.2024.
//

import SwiftUI

struct DetailView: View {
    
    @State private var detailViewModel  : CoinDetailViewModel
    @State private var isReadMoreActive : Bool = false
    
    var columns : [GridItem] =  Array(repeating: GridItem(.flexible(),alignment: .leading), count: 2)
        
    var spacing : CGFloat = 30

    
    
    init(coin :CoinModel) {
        self.detailViewModel = CoinDetailViewModel(coin: coin)
    }
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing : 30){
                ChartView(coin: detailViewModel.coin)
                  
                
                VStack (spacing:20) {
                    
                    Text("OverView")
                        .font(.title.bold())
                        .foregroundStyle(Theme.color.accentColor)
                        .frame(maxWidth: .infinity , alignment: .leading)
                    
                    
                    ZStack {
                        if let description = detailViewModel.coinDetails?.description?.en {
                            VStack (alignment : .leading ) {
                                Text(description)
                                    .lineLimit(self.isReadMoreActive ? nil  : 3)
                                
                                
                                Button(action: {
                                    self.isReadMoreActive.toggle()
                                }, label: {
                                    Text(isReadMoreActive ? "Less" :  "Read more.." )
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .padding(.vertical ,4)
                                })
                                .tint(Color.blue )
                            }
                         
                        }
                    }
                    
                    
                }
              
                
    
                Divider()
                
                LazyVGrid(columns: columns ,alignment: .leading , spacing: spacing) {
                
                    ForEach(detailViewModel.overwievStats) { stat in
                        StatisticView(stat: stat)
                    }
                }
          
                Text("Additional Details")
                    .font(.title.bold())
                    .foregroundStyle(Theme.color.accentColor)
                    .frame(maxWidth: .infinity , alignment: .leading)
                
                Divider()
                
                LazyVGrid(columns: columns ,alignment: .leading , spacing: spacing) {
                
                    ForEach(detailViewModel.additionalStats) { stat in
                        StatisticView(stat: stat)
                    }
                }
            }
            .padding(.horizontal)
        }
        .navigationTitle(detailViewModel.coin.name )
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                HStack {
                    Text(detailViewModel.coin.symbol.uppercased())
                
                    AsyncImageForCoin(url: detailViewModel.coin.image, circleImageSize: 25)
                    
                }
            }
        }

    }
}

#Preview {
    ContentView()
}
