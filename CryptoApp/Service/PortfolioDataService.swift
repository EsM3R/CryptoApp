//
//  PortfolioDataService.swift
//  CryptoApp
//
//  Created by Mehmet Vural on 25.04.2024.
//

import Foundation
import CoreData

class PortfolioDataService {
    
    private let container :  NSPersistentContainer
    private let containerName : String = "PortfolioContainer"
    private let entityName : String = "PortfolioEntity"
    
    static let shared = PortfolioDataService()
    
    var allPortfolio : [PortfolioEntity] =  []
    
    private init() {
        container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { data, error in
            if let error = error  {
                print("\(error.localizedDescription)")
            }
        }
    }
    
    
    func updatePortfolio(coin : CoinModel , amount : Double ) {
        

    }

    
    private func add(coin : CoinModel , amount : Double){
        
        let entity = PortfolioEntity(context: container.viewContext)
        
        entity.coinID = coin.id
        entity.amount = amount
        
        applyChanges()
    
    }
    
    private func getPortfolio(){
        
        let request = NSFetchRequest<PortfolioEntity>(entityName: entityName)
        
        do{
            self.allPortfolio = try container.viewContext.fetch(request)
        }catch let error{
            print(error.localizedDescription)
        }
    }
    
    private func update(entity : PortfolioEntity , amount : Double) {
        entity.amount = amount
        applyChanges()
    }
    
    private func remove(entity : PortfolioEntity) {
        container.viewContext.delete(entity)
    }
    
    private func save(){
        
        do {
            try container.viewContext.save()
        }catch let error {
            print(error.localizedDescription)
        }
    }
    
    private func applyChanges(){
        self.save()
        self.getPortfolio()
    }
}
