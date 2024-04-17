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
                .foregroundStyle(Color.theme.secondary)
                
            
            Text(stat.value)
                .font(.headline)
                .foregroundStyle(Color.theme.accent)
        
            HStack(spacing : 2){
                Image(systemName: "triangle.fill")
                    .font(.caption2)
                    .rotationEffect(Angle(degrees: (stat.percentChanges ?? 0) >= 0 ? 0 : 180))
                
                Text("\(stat.percentChanges?.asPercentString() ?? "")")
            }
            .foregroundStyle(stat.percentChanges ?? 0 >= 0 ? Color.theme.green : Color.theme.red)
            .opacity(stat.percentChanges == nil ? 0.0 : 1.0)
            
        }
        
    }
}

#Preview {
    StatisticView(stat: DeveloperPreview.instance.stat1)
   
}
