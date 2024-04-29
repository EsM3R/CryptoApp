//
//  PortfolioViewModel.swift
//  CryptoApp
//
//  Created by Mehmet Vural on 29.04.2024.
//

import Foundation
import SwiftData
import Observation


@Observable
class PortfolioViewModel {
    
    
    var modelContext : ModelContext? = nil
    
    var portfolioCoins: [PortfolioModel] = []
    
    init() {
        self.fetchData()
    }
    
    func fetchData() {
        
        let fetchDescriptor =  FetchDescriptor<PortfolioModel>()

        do {
            self.portfolioCoins = try modelContext?.fetch(fetchDescriptor) ?? []
        } catch let error {
            print(error.localizedDescription)
        }
        
    }
    
    func addPortfolio(coin : CoinModel ,amount : Double){
        
        let model = PortfolioModel(coinId: coin.id, amount: amount)
        modelContext?.insert(model)
        applyChanges()

    }
    
    func deletePortfolio(_ indexSet : IndexSet  ){
        indexSet.forEach { index in
            let model =  self.portfolioCoins[index]
            modelContext?.delete(model)
        }
        applyChanges()
    }
    func deletePortfolio(model :  PortfolioModel) {
        modelContext?.delete(model)
        applyChanges()
    }
    
    func updatePortfolio(coin  : CoinModel , amount : Double){
    
        if let portfolioCoin = self.portfolioCoins.first(where: { $0.coinId == coin.id}) {
            if amount > 0  {
                portfolioCoin.amount = amount
            }else {
                deletePortfolio(model: portfolioCoin)
            }
        }else {
            self.addPortfolio(coin: coin, amount: amount)
        }
    
        
        applyChanges()
    }
    
    func applyChanges() {
        save()
        fetchData()
    }
    
    func save(){
        do {
           try modelContext?.save()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    
     
    
}

