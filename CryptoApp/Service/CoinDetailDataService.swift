//
//  CoinDetailDataService.swift
//  CryptoApp
//
//  Created by Mehmet Vural on 30.04.2024.
//

import Foundation



class CoinDetailDataService {
    
    static let shared = CoinDetailDataService()
    
    private init(){}
    
    func getCoin(coin : CoinModel ,onSuccess : @escaping (CoinDetailModel) -> Void , onFailure : @escaping (Error) -> Void){
        
        let urlString : String = "https://api.coingecko.com/api/v3/coins/\(coin.id)?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false"
        
        
        guard let url = URL(string: urlString  )else {return}
        
        let task = URLSession.shared.dataTask(with: url) { data, _ , error in

            guard let data = data , error == nil else {return}
            
            do{
                let json = try JSONDecoder().decode(CoinDetailModel.self, from: data)
                
                DispatchQueue.main.async {
                    onSuccess(json)
                }
                
            }catch let error{
                onFailure(error)
            }
        }
        
        task.resume()
    }
}
