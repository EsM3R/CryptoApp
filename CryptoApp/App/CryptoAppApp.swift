//
//  CryptoAppApp.swift
//  CryptoApp
//
//  Created by Mehmet Vural on 13.03.2024.
//

import SwiftUI
import SwiftData


@main
struct CryptoAppApp: App {

    var body: some Scene {
        
        WindowGroup {
            
           ContentView()
        }
        .modelContainer(for: PortfolioModel.self)
    
    }
}
