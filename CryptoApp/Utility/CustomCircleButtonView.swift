//
//  CustomCircleButtonView.swift
//  CryptoApp
//
//  Created by Mehmet Vural on 19.03.2024.
//

import SwiftUI

struct CustomCircleButtonView: View {
    
    let iconName : String
    
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundStyle(Color.theme.accent)
            .frame(width: 50 , height: 50)
            .background(Circle().foregroundStyle(Color.theme.background))
            .shadow(color : Color.theme.accent.opacity(0.2) ,  radius: 10 , x : 0 ,y : 0)
            .padding()
    }
}
