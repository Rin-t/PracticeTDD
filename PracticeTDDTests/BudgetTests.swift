//
//  BudgetTests.swift
//  PracticeTDDTests
//
//  Created by Rin on 2023/06/05.
//

import XCTest
@testable import PracticeTDD

final class BudgetTests: XCTestCase {

    func test_週の残りの予算を含んでいること() {
        let amounts: [Decimal] = [0, 1, 2, 123]
        amounts.forEach {
            let budget = Budget(total: $0)
            XCTAssertEqual(budget.weeklyRemaining, $0)
        }
    }

    func test_日の残りの予算を含んでいること() {
        let amounts: [Decimal] = [0, 7, 14, 70]
        amounts.forEach {
            let budget = Budget(total: $0)
            XCTAssertEqual(budget.dailyRemaining, $0 / 7, "dailyRemaining is not \($0)/7")
        }
    }

    func test_週の残り予算から使用した金額が引かれていること() {
        let budget = Budget(total: 10)
        budget.addTransaction(amount: 0, timestamp: Date())
        XCTAssertEqual(budget.weeklyRemaining, 10)

        budget.addTransaction(amount: 1, timestamp: Date())
        XCTAssertEqual(budget.weeklyRemaining, 9)

        budget.addTransaction(amount: 2, timestamp: Date())
        XCTAssertEqual(budget.weeklyRemaining, 7)
    }

    func test_日の残り予算から使用した金額が引かれていること() {
        let budget = Budget(total: 70)
        budget.addTransaction(amount: 0, timestamp: Date())
        XCTAssertEqual(budget.dailyRemaining, 10)

        budget.addTransaction(amount: 1, timestamp: Date())
        XCTAssertEqual(budget.dailyRemaining, 9)

        budget.addTransaction(amount: 2, timestamp: Date())
        XCTAssertEqual(budget.dailyRemaining, 7)
    }

}
