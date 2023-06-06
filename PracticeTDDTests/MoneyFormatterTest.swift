//
//  PracticeTDDTests.swift
//  PracticeTDDTests
//
//  Created by Rin on 2023/06/01.
//

import XCTest
@testable import PracticeTDD


final class MoneyFormatterTest: XCTestCase {

    func test_入力した整数が小数点第二位まで0をつけた形に変換されること() {
        XCTAssertEqual(Decimal(string: "0")?.moneyString, "0.00")
        XCTAssertEqual(Decimal(string: "1")?.moneyString, "1.00")
        XCTAssertEqual(Decimal(string: "2")?.moneyString, "2.00")
        XCTAssertEqual(Decimal(string: "20")?.moneyString, "20.00")
        XCTAssertEqual(Decimal(string: "-2")?.moneyString, "-2.00")
    }

    func test_入力した小数点第一位までの数字が小数点第二位に0をつけた文字列に変換されること() {
        XCTAssertEqual(Decimal(string: "1.1")?.moneyString, "1.10")
        XCTAssertEqual(Decimal(string: "1.2")?.moneyString, "1.20")
        XCTAssertEqual(Decimal(string: "-1.2")?.moneyString, "-1.20")
    }

    func test_入力した小数点第二位までの数字が小数点第二位に0をつけた文字列に変換されること() {
        XCTAssertEqual(Decimal(string: "1.11")?.moneyString, "1.11")
        XCTAssertEqual(Decimal(string: "1.12")?.moneyString, "1.12")
        XCTAssertEqual(Decimal(string: "-1.12")?.moneyString, "-1.12")
    }

    func test_入力した小数点第三位までの数字の少数点第三位の値が切り捨てられた文字列に変換されること() {
        XCTAssertEqual(Decimal(string: "1.111")?.moneyString, "1.11")
        XCTAssertEqual(Decimal(string: "1.119")?.moneyString, "1.11")
        XCTAssertEqual(Decimal(string: "-1.111")?.moneyString, "-1.12")
    }
}

