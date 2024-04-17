//
//  AsyncImageForCoin.swift
//  CryptoApp
//
//  Created by Mehmet Vural on 6.04.2024.
//

import SwiftUI

struct AsyncImageForCoin: View {

    let url : String
    let circleImageSize : CGFloat

    var body: some View {
        AsyncImage(url: URL(string: url)){phase in
            
            switch phase{
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: circleImageSize, height: circleImageSize)
                    
            case .empty:
                defaultImage
            case .failure(_):
                defaultImage
            @unknown default:
                defaultImage
            }
            
            
        }
    }
    
    private var defaultImage : some View {
        Circle()
            .frame(width: circleImageSize, height: circleImageSize)
    }
}

