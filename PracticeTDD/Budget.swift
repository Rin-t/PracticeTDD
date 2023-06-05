//
//  Budget.swift
//  PracticeTDD
//
//  Created by Rin on 2023/06/05.
//

import Foundation

final class Budget {

    var weeklyRemaining: Decimal {
        return _weeklyRemaining
    }
    var dailyRemaining: Decimal {
        return _dailyRemaining
    }

    private var _weeklyRemaining: Decimal
    private var _dailyRemaining: Decimal
    

    init(total: Decimal) {
        _weeklyRemaining = total
        _dailyRemaining = total / 7
    }

    func addTransaction(amount: Decimal, timestamp: Date) {
        _weeklyRemaining -= amount
        _dailyRemaining -= amount
    }
}
