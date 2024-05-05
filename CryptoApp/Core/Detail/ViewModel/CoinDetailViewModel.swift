//
//  CoinDetailViewModel.swift
//  CryptoApp
//
//  Created by Mehmet Vural on 30.04.2024.
//

import Foundation

@Observable
class CoinDetailViewModel {
    
    var coinDetails : CoinDetailModel? = nil
    
    var overwievStats = [StatisticModel]()
    var additionalStats = [StatisticModel]()
    
    var coin  : CoinModel
    
    init(coin: CoinModel) {
        self.coin = coin
        self.fetchCoin(coin: coin)
        overViewStats(coin)
        additonalStats(coin)
    }
    
    func fetchCoin(coin : CoinModel) {
        
        CoinDetailDataService.shared.getCoin(coin: coin) { coin in
            self.coinDetails = coin
            
        } onFailure: { error in
            print(error.localizedDescription)
        }

    }
    
    func overViewStats(_ coin : CoinModel){
        
        let price = coin.currentPrice.asCurrencyWith6Decimals()
        let priceChange = coin.priceChangePercentage24H
        
        let priceStats = StatisticModel(title: "Current Price", value: price, percentChanges: priceChange)
        
        let marketCap = "$" + (coin.marketCap?.formattedWithAbbreviations() ?? "")
        let marketCapChanges = coin.marketCapChangePercentage24H
        
        let marketCapStats = StatisticModel(title: "Market Capitalization", value: marketCap, percentChanges: marketCapChanges)
        
        let rank = "\(coin.rank)"
        
        let rankStats = StatisticModel(title: "Rank", value: rank)
        
        
        let volume = "$" + (coin.totalVolume?.formattedWithAbbreviations() ?? "")
        
        let volumeStats = StatisticModel(title: "Volume ", value: marketCap)
        
        
        self.overwievStats.append(contentsOf: [priceStats , marketCapStats ,  rankStats , volumeStats])
    }
    
    func additonalStats(_ coin : CoinModel){
    
        let high = coin.high24H?.asCurrencyWith6Decimals() ?? "n/a"
        let highStats = StatisticModel(title: "24h High", value: high)
        
        let low = coin.high24H?.asCurrencyWith6Decimals() ?? "n/a"
        let lowStats = StatisticModel(title: "24h Low", value: low)
        
        let priceChange = coin.priceChange24H?.asCurrencyWith6Decimals() ?? "n/a"
        let priceChangePercentage = coin.priceChangePercentage24H
        
        let priceStats = StatisticModel(title: "24h Price", value: priceChange, percentChanges: priceChangePercentage)
        
        let marketCap = "$" + (coin.marketCapChange24H?.formattedWithAbbreviations() ?? "")
        let marketCapChange24H = coin.marketCapChange24H
        
        let marketCapChange24HStats = StatisticModel(title: "24h Market Cap Change", value: marketCap, percentChanges: marketCapChange24H)
        
        
        let blockTime = self.coinDetails?.blockTimeInMinutes ?? 0
        let blockTimeString  = blockTime == 0 ? "n/a" : "\(blockTime)"
        let blockTimeStats = StatisticModel(title: "Block Time", value: blockTimeString)
        
        let hashing = self.coinDetails?.hashingAlgorithm ?? "n/a"

        let hashingStats = StatisticModel(title: "Hashing Algorithm", value: blockTimeString)
        
        self.additionalStats.append(contentsOf: [highStats , lowStats , priceStats , marketCapChange24HStats , blockTimeStats , hashingStats])
    }
 
}
