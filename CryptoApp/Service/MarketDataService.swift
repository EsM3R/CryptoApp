//
//  MarketDataService.swift
//  CryptoApp
//
//  Created by Mehmet Vural on 2.04.2024.
//

import Foundation


class MarketDataService {
     
    static let shared = MarketDataService()
    
    private init() {}
    
    func getMarketData(onSuccess : @escaping (GlobalData) -> Void  , onFailure : @escaping(Error) -> Void ){
       
        let urlString  = "https://api.coingecko.com/api/v3/global"
        
        guard let url = URL(string: urlString) else {return}
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data , error == nil else {return}
            
            do{
                let jsonData = try JSONDecoder().decode(GlobalData.self, from: data)
                onSuccess(jsonData)
                
            }catch{
                onFailure(error)
            }
        }
        task.resume()
        
    }
    
}
