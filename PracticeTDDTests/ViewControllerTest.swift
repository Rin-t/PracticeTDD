//
//  ViewControllerTest.swift
//  PracticeTDDTests
//
//  Created by Rin on 2023/06/06.
//

import XCTest
@testable import PracticeTDD

final class ViewControllerTest: XCTestCase {

    var viewController: ViewController!

    override func setUp() {
        super.setUp()
        viewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as? ViewController
        _ = viewController.view
    }

    func test_入力した予算が週の残りの予算ラベルに反映されていること() {
        let textField = viewController.totalBudgetTextField!
        textField.text = "100"
        _ = textField.delegate?.textFieldShouldReturn?(textField)

        let budget = self.viewController.budget

        XCTAssertEqual(viewController.weeklyRemainingLabel.text,
                       budget?.weeklyRemaining.moneyString)

        XCTAssertEqual(budget?.dailyRemaining.moneyString,
                       viewController.todayRemainingLabel.text)
    }

    func test_消費時の残りの予算がLabelに反映されていること() {
        let budget = Budget(total: 70)
        budget.addTransaction(amount: 5, timestamp: Date())

        let textField1 = viewController.totalBudgetTextField!
        textField1.text = "70"
        _ = textField1.delegate?.textFieldShouldReturn?(textField1)

        let textField2 = viewController.transactionTextField!
        textField2.text = "5"
        _ = textField2.delegate?.textFieldShouldReturn?(textField2)

        XCTAssertEqual(viewController.weeklyRemainingLabel.text,
                       budget.weeklyRemaining.moneyString)

        XCTAssertEqual(viewController.todayRemainingLabel.text,
                       budget.dailyRemaining.moneyString)
    }
}
