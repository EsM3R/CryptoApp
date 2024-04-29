//
//  NavbarView.swift
//  CryptoApp
//
//  Created by Mehmet Vural on 19.03.2024.
//

import SwiftUI


fileprivate enum  ShowPortfolio{
    case portfolio
    case livePrices
    
    var getIconName : String{
        
        switch self {
            
        case .portfolio: return "plus"
            
        case .livePrices:  return "info"

        }
    }
    var getTitleName : String {
        switch self {
            
        case .portfolio: return "Portfoliio"
            
        case .livePrices:  return "Live Prices"

        }
    }
}

struct NavbarView: View {
    
    @Binding var isShowPortfolio : Bool
    @State private var showPortfolioSheet : Bool = false
    
    var body: some View {
        HStack{
          
            CustomCircleButtonView(iconName: isShowPortfolio ?
                                    ShowPortfolio.portfolio.getIconName :
                                    ShowPortfolio.livePrices.getIconName)
            
                .background(CircleButtonAnimationView(isAnimating: $isShowPortfolio))
                .onTapGesture {
                    if isShowPortfolio{
                        showPortfolioSheet.toggle()
                    }
                }
                .sheet(isPresented: $showPortfolioSheet, content: {

                    PortfolioView()
//                        .presentationDragIndicator(.hidden)
//                        .presentationDetents([.medium , .large])
//                        .presentationCornerRadius(12)
                        .presentationCompactAdaptation(.fullScreenCover)
                        
                      
                })
            
            Spacer()
            
            Text(isShowPortfolio  ? ShowPortfolio.portfolio.getTitleName : ShowPortfolio.livePrices.getTitleName)
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundStyle(Theme.color.accentColor)
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
 
