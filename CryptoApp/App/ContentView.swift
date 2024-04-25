//
//  ContentView.swift
//  CryptoApp
//
//  Created by Mehmet Vural on 28.03.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var homeViewModel : HomeViewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack{
            HomeView()
        }
        .navigationBarBackButtonHidden()
        .environment(homeViewModel)
    }
}

#Preview {
    ContentView()
}
