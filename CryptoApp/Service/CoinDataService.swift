//
//  CoinDataService.swift
//  CryptoApp
//
//  Created by Mehmet Vural on 29.03.2024.
//

import Foundation


class CoinDataService {
    
    static let shared = CoinDataService()
    
    private init(){}
    
    func getAllCoins(onSuccess : @escaping ([CoinModel]) -> Void , onFailure : @escaping (Error) -> Void){
        
        let urlString : String = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h"
        
        
        guard let url = URL(string: urlString  )else {return}

        let task = URLSession.shared.dataTask(with: url) { data, _ , error in

            guard let data = data , error == nil else {return}
            
            do{
                let json = try JSONDecoder().decode([CoinModel].self, from: data)
                onSuccess(json)
            }catch{
                onFailure(error)
            }
        }
        
        task.resume()
    }
}
