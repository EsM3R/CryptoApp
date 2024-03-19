//
//  CircleButtonAnimationView.swift
//  CryptoApp
//
//  Created by Mehmet Vural on 19.03.2024.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    
    @Binding var isAnimating : Bool
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 5)
            .scale(isAnimating ?  1.0  : 0.0)
            .opacity(isAnimating ?  0.0  :  1.0)
            .animation(isAnimating ? .easeOut(duration: 0.5) : .none)
            .onAppear{
                isAnimating.toggle()
            }
       
    }
}
