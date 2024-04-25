//
//  StatisticView.swift
//  CryptoApp
//
//  Created by Mehmet Vural on 1.04.2024.
//

import SwiftUI

struct StatisticView: View {
    
    let stat : StatisticModel
    
    var body: some View {
        VStack(alignment : .leading){
            Text(stat.title)
                .font(.caption)
                .foregroundStyle(Theme.color.secondaryColor)
                
            
            Text(stat.value)
                .font(.headline)
                .foregroundStyle(Theme.color.accentColor)
        
            HStack(spacing : 2){
                Image(systemName: "triangle.fill")
                    .font(.caption2)
                    .rotationEffect(Angle(degrees: (stat.percentChanges ?? 0) >= 0 ? 0 : 180))
                
                Text("\(stat.percentChanges?.asPercentString() ?? "")")
            }
            .foregroundStyle(stat.percentChanges ?? 0 >= 0 ? Theme.color.greenColor : Theme.color.redColor)
            .opacity(stat.percentChanges == nil ? 0.0 : 1.0)
            
        }
        
    }
}
//
//#Preview {
//    StatisticView(stat: DeveloperPreview.instance.stat1)
//   
//}
