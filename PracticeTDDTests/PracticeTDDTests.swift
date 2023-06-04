//
//  PracticeTDDTests.swift
//  PracticeTDDTests
//
//  Created by Rin on 2023/06/01.
//

import XCTest
@testable import PracticeTDD


final class PracticeTDDTests: XCTestCase {

    func test_入力した整数が小数点第二位まで0をつけた形に変換されること() {
        let formatter = MoneyFormatter()
        XCTAssertEqual(formatter.string(decimal: Decimal(string: "0")!), "0.00")
        XCTAssertEqual(formatter.string(decimal: Decimal(string: "1")!), "1.00")
        XCTAssertEqual(formatter.string(decimal: Decimal(string: "2")!), "2.00")
        XCTAssertEqual(formatter.string(decimal: Decimal(string: "20")!), "20.00")
        XCTAssertEqual(formatter.string(decimal: Decimal(string: "-2")!), "-2.00")
    }

    func test_入力した小数点第一位までの数字が小数点第二位に0をつけた文字列に変換されること() {
        let formatter = MoneyFormatter()
        XCTAssertEqual(formatter.string(decimal: Decimal(string: "1.1")!), "1.10")
        XCTAssertEqual(formatter.string(decimal: Decimal(string: "1.2")!), "1.20")
        XCTAssertEqual(formatter.string(decimal: Decimal(string: "-1.2")!), "-1.20")
    }

    func test_入力した小数点第二位までの数字が小数点第二位に0をつけた文字列に変換されること() {
        let formatter = MoneyFormatter()
        XCTAssertEqual(formatter.string(decimal: Decimal(string: "1.11")!), "1.11")
        XCTAssertEqual(formatter.string(decimal: Decimal(string: "1.12")!), "1.12")
        XCTAssertEqual(formatter.string(decimal: Decimal(string: "-1.12")!), "-1.12")
    }

    func test_入力した小数点第三位までの数字の少数点第三位の値が切り捨てられた文字列に変換されること() {
        let formatter = MoneyFormatter()
        XCTAssertEqual(formatter.string(decimal: Decimal(string: "1.111")!), "1.11")
        XCTAssertEqual(formatter.string(decimal: Decimal(string: "1.119")!), "1.11")
        XCTAssertEqual(formatter.string(decimal: Decimal(string: "-1.111")!), "-1.12")
    }
}

