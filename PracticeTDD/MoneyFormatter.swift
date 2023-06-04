//
//  MoneyFormatter.swift
//  PracticeTDD
//
//  Created by Rin on 2023/06/04.
//

import Foundation

struct MoneyFormatter {

    func string(decimal: Decimal) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.roundingMode = .floor
        let number = numberFormatter.string(from: decimal as NSDecimalNumber)
        return "\(number ?? "")"
    }
    
}
