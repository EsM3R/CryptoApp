//
//  String.swift
//  CryptoApp
//
//  Created by Mehmet Vural on 5.05.2024.
//

import Foundation


extension  String {
    
    var removeHTMLTags : String  {
        return self.replacingOccurrences(of: "<[^>]+>", with: "" , options: .regularExpression , range:nil )
    }
}
