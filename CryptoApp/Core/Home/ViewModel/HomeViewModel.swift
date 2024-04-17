//
//  HomeViewModel.swift
//  CryptoApp
//
//  Created by Mehmet Vural on 28.03.2024.
//

import Foundation


class HomeViewModel : ObservableObject{
    
    
    @Published var stats : [StatisticModel] = [
        .init(title: "Title", value: "Value" ,percentChanges: 1),
        .init(title: "Title", value: "Value" ),
        .init(title: "Title", value: "Value" ,percentChanges: nil),
        .init(title: "Title", value: "Value" ,percentChanges: -1)
    ]
    
    @Published var allCoins : [CoinModel] = []
    
    private var allStroedCoins : [CoinModel] = []
    
    @Published var portfolioCoins : [CoinModel] = [DeveloperPreview.instance.coin]
    
    @Published var searchText : String = "" {
        didSet{
            if searchText.isEmpty{
                self.allCoins = allStroedCoins
            }else{
                self.allCoins = allStroedCoins
                self.allCoins = filterCoins()
            }
        }
    }

    
    init(){
        getAllCoins()
    }
    
    func getAllCoins(){
        
        CoinDataService.shared.getAllCoins {  allCoins in
            
            DispatchQueue.main.async {
                self.allCoins = allCoins
                self.allStroedCoins = allCoins
            }
           
        } onFailure: { error in
            print("Something went wrong")
        }
        
        MarketDataService.shared.getMarketData { datas in
            
            self.stats = []
            
            DispatchQueue.main.async {
                datas.data.map { market in
                    let marketCap = StatisticModel(title: "Market Cap", value: market.marketCap, percentChanges: market.marketCapChangePercentage24HUsd)
                    let volume = StatisticModel(title: "24h Volume", value: market.volume)
                    let btcDominance = StatisticModel(title: "BTC Dominance", value: market.btcDominance)
                    let portfolio = StatisticModel(title: "Portfolio Value", value: "$0.00", percentChanges:0)
                    
                    self.stats.append(contentsOf: [marketCap ,volume ,  btcDominance , portfolio])
                }
            }
           
        } onFailure: { error in
            print("Something went wrong")
        
        }
    }
    
    func filterCoins() -> [CoinModel] {
        guard  !searchText.isEmpty else {
            return self.allCoins
        }
        
        let lowerCasedSearchText : String = searchText.lowercased()
        
        let allFiltered =  self.allCoins.filter { coin in
            coin.name.lowercased().contains(lowerCasedSearchText) ||
            coin.id.lowercased().contains(lowerCasedSearchText) ||
            coin.symbol.lowercased().contains(lowerCasedSearchText)
        }
        return allFiltered
    }
    
    
    
}
