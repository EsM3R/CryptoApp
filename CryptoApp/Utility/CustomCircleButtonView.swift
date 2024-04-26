//
//  CustomCircleButtonView.swift
//  CryptoApp
//
//  Created by Mehmet Vural on 19.03.2024.
//

import SwiftUI

struct CustomCircleButtonView: View {
    
    let iconName : String
    
    private let iconWidth : CGFloat = 50
    private let iconHeight : CGFloat = 50

    
    
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundStyle(Theme.color.accentColor)
            .frame(width: iconWidth , height: iconHeight)
            .background(Circle().foregroundStyle(Theme.color.backgroundColor))
            .shadow(color : Theme.color.accentColor.opacity(0.2) ,
                    radius: 10 ,
                    x : 0 ,
                    y : 0)
            .padding()
    }
}
