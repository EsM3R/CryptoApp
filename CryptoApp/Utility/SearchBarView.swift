//
//  SearchBarView.swift
//  CryptoApp
//
//  Created by Mehmet Vural on 29.03.2024.
//

import SwiftUI

struct SearchBarView: View {
    
    @Environment(HomeViewModel.self) private var homeViewModel
    
    @State private var searchText : String = ""
    
    var body: some View {
        
        HStack(spacing : 0){
            
            Image(systemName: "magnifyingglass")
                .foregroundStyle(homeViewModel.searchText.isEmpty ? 
                                 Theme.color.secondaryColor : Theme.color.accentColor)
                
            TextField("Search by name or symbol",
                      text: $searchText)
                .autocorrectionDisabled()
                .foregroundStyle(Theme.color.accentColor)
                .padding(.leading,5)
                .overlay(alignment: .trailing) {
                    
                    Button(action: {
                        self.deleteText()
                        
                    }, label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title3)
                            .foregroundStyle(Theme.color.accentColor)
                    })
        
                }
        }
        .onChange(of: self.searchText, {
            self.homeViewModel.searchText = self.searchText
        })
        .font(.headline)
        .padding()
        .background(Theme.color.backgroundColor)
        .clipShape(.capsule)
        .shadow(color : Theme.color.accentColor.opacity(0.2),radius: 10)
    }
    
    private func deleteText(){
        self.searchText = ""
    }
}

