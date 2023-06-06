//
//  MoneyFormatter.swift
//  PracticeTDD
//
//  Created by Rin on 2023/06/04.
//

import Foundation

extension Decimal {

    var moneyString: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.roundingMode = .floor
        return numberFormatter.string(from: self as NSDecimalNumber) ?? ""
    }
}
