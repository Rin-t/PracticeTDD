//
//  ViewController.swift
//  PracticeTDD
//
//  Created by Rin on 2023/05/31.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var totalBudgetTextField: UITextField!
    @IBOutlet weak var transactionTextField: UITextField!
    @IBOutlet weak var weeklyRemainingLabel: UILabel!
    @IBOutlet weak var todayRemainingLabel: UILabel!

    var budget: Budget?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        transactionTextField.delegate = self
        totalBudgetTextField.delegate = self
    }

    private func updateBudgetLabels() {
        weeklyRemainingLabel.text = budget?.weeklyRemaining.moneyString
        todayRemainingLabel.text = budget?.dailyRemaining.moneyString
    }

}

extension ViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let total = Decimal(string: textField.text!) else {
            return true
        }

        if textField == totalBudgetTextField {
            budget = Budget(total: total)
        }

        if textField == transactionTextField {
            budget?.addTransaction(amount: total, timestamp: Date())
        }

        updateBudgetLabels()
        return true
    }
}

