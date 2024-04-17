//
//  SearchBarView.swift
//  CryptoApp
//
//  Created by Mehmet Vural on 29.03.2024.
//

import SwiftUI

struct SearchBarView: View {

    @Binding var searchText : String
    
    var body: some View {
        
        HStack(spacing : 0){
            
            Image(systemName: "magnifyingglass")
                .foregroundStyle(searchText.isEmpty ? Color.theme.secondary : Color.theme.accent)
                
            TextField("Search by name or symbol", text: $searchText)
                .autocorrectionDisabled()
                .foregroundStyle(Color.theme.accent)
                .padding(.leading,5)
                .overlay(alignment: .trailing) {
                    
                    Image(systemName: "xmark.circle.fill")
                        .font(.title3)
                        .foregroundStyle(Color.theme.accent)
                        .onTapGesture {
                            self.searchText = ""
                        }
                }
        }
        .font(.headline)
        .padding()
        .background(Color.theme.background)
        .clipShape(.capsule)
        .shadow(color : Color.theme.accent.opacity(0.2),radius: 10)
        .padding()
    }
}

