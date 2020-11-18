//
//  DoubleExtension.swift
//  olivia-test
//
//  Created by Leandro Souza da Silva (P) on 17/11/20.
//  Copyright © 2020 Leandro Souza da Silva (P). All rights reserved.
//

import Foundation

extension Double {
    // formatting text for currency textField
    func currencyFormatting() -> String {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt-BR")
        formatter.maximumFractionDigits = 2
        if let str = formatter.string(for: self) {
            return str
        }
        return ""
    }
}
