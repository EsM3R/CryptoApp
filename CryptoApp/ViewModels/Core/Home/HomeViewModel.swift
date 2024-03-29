//
//  HomeViewModel.swift
//  CryptoApp
//
//  Created by Mehmet Vural on 28.03.2024.
//

import Foundation


class HomeViewModel : ObservableObject{
    
    @Published var allCoins : [CoinModel] = []
    private var allStroedCoins : [CoinModel] = []
    @Published var portfolioCoins : [CoinModel] = [DeveloperPreview.instance.coin]
    @Published var searchText : String = "" {
        didSet{
            if searchText.isEmpty{
                self.allCoins = allStroedCoins
            }else{
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
