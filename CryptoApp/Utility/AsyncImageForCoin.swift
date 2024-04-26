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
           
            case .success(let image) :
            onSuccessImageImage(image: image)
                                    
            case .empty:
                onFailureImage
            case .failure(_):
                onFailureImage
            @unknown default:
                onFailureImage
            }
            
            
        }
    }
    
}
extension AsyncImageForCoin {
    
    @ViewBuilder
    private var onFailureImage : some View {
        Circle()
            .frame(width: circleImageSize, height: circleImageSize)
    }
    
    
    @ViewBuilder
    private func onSuccessImageImage(image : Image) ->  some View {
            image
                .resizable()
                .scaledToFit()
                .frame(width: circleImageSize, height: circleImageSize)
        
   

    }

}
