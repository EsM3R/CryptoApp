//
//  HomeViewModel.swift
//  CryptoApp
//
//  Created by Mehmet Vural on 28.03.2024.
//

import SwiftUI
import SwiftData

@Observable class HomeViewModel{
    
    var newSearchText : String = ""
    
    var stats : [StatisticModel] = [
        .init(title: "Title", value: "Value" ,percentChanges: 1),
        .init(title: "Title", value: "Value" ),
        .init(title: "Title", value: "Value" ,percentChanges: nil),
    ]
    
    var myTotalPortfolio : Double = 0
    var myPortfolioPercentChange : Double = 0
    var allCoins : [CoinModel] = []

    private var allStroedCoins : [CoinModel] = []
    
    
    
    var searchText : String = "" {
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
        getAllData()
    }
    
    
    func getAllData(){
        getMarketData()
        getAllCoins()
       
    }
    

    
    func getAllCoins(){
        
        CoinDataService.shared.getAllCoins {  allCoins in
            
            DispatchQueue.main.async {
                self.allCoins = allCoins
                self.allStroedCoins = allCoins
            }
            
        } onFailure: { error in
            print(error.localizedDescription)
        }
        
  
    }
    
    func getMarketData() {
        
        MarketDataService.shared.getMarketData { data in
            self.stats = []
            DispatchQueue.main.async {
                data.data.map { market in
                    let marketCap = StatisticModel(title: "Market Cap", 
                                                   value: market.marketCap,
                                                   percentChanges: market.marketCapChangePercentage24HUsd)
                    let volume = StatisticModel(title: "24h Volume",
                                                value: market.volume)
                    let btcDominance = StatisticModel(title: "BTC Dominance", 
                                                      value: market.btcDominance)
                    let portfolio = StatisticModel(title: "Portfolio Value",
                                                   value: self.myTotalPortfolio.asNumberString(),
                                                   percentChanges:self.myPortfolioPercentChange)
                    
                    self.stats.append(contentsOf: [marketCap ,volume ,  btcDominance , portfolio])
                }
            }
            
        } onFailure: { error in
            fatalError("\(error.localizedDescription)")
            
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
    
    
    func removeSearchText(){
        self.searchText = ""
    }
    
    
    func getCoinById(portfolioModel : PortfolioModel) -> CoinModel{
        
        if let coinModel = self.allCoins.first(where: {  $0.id == portfolioModel.coinId}){
            return coinModel
        }else{
            return DeveloperPreview.instance.coin
        }
        
    }
    
    func calcualatePortfolioValue(portfolioCoins: [PortfolioModel]) {
        
        portfolioCoins.forEach { coin  in
            if let coinModel = self.allCoins.first(where: {  $0.id == coin.coinId}){
                
                self.myTotalPortfolio += coinModel.currentPrice * coin.amount
                let currrntValue = coinModel.currentPrice
                let percentChange = coinModel.priceChangePercentage24H ?? 0  / 100
                let previousValue = currrntValue / (1 + percentChange)
                self.myPortfolioPercentChange = previousValue
            }
        }
        
        self.stats.removeLast()
        let portfolio = StatisticModel(title: "Portfolio Value",
                                       value: self.myTotalPortfolio.asNumberString(),
                                       percentChanges:self.myPortfolioPercentChange)
        self.stats.append(portfolio)
       
       
      
    }
    
    
   
    
}
