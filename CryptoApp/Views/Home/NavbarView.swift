//
//  NavbarView.swift
//  CryptoApp
//
//  Created by Mehmet Vural on 19.03.2024.
//

import SwiftUI

struct NavbarView: View {
    
    @Binding var isShowPortfolio : Bool
    
    var body: some View {
        HStack{
          
            CustomCircleButtonView(iconName: isShowPortfolio ? "plus" : "info")
                .background(CircleButtonAnimationView(isAnimating: $isShowPortfolio))
            
            Spacer()
            
            Text(isShowPortfolio  ? "Portfoliio" :  "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundStyle(Color.theme.accent)
                .animation(.none)
            
            Spacer()
            
            CustomCircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: isShowPortfolio ?  180 : 0))
                .onTapGesture {
                    withAnimation {
                        isShowPortfolio.toggle()
                    }
                }
            
        }
        
    }
}
 
