//
//  ContentView.swift
//  CryptoApp
//
//  Created by Mehmet Vural on 13.03.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "bitcoinsign.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200 , height: 200)
                .foregroundStyle(Color.black )
                
            Text("Crypto App")
                .font(.largeTitle)
                .fontWeight(.heavy)
                
           
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
