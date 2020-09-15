//
//  ViewController.swift
//  tipCalculator
//
//  Created by Xhoana Koca on 9/14/20.
//  Copyright © 2020 Xhoana Koca. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var totalBillAmountTextField: UITextField!
    @IBOutlet weak var preferredTipSegmentedControl: UISegmentedControl!
    @IBOutlet weak var customTipTextField: UITextField!
    @IBOutlet weak var splitTipTextField: UITextField!
    @IBOutlet weak var totalAmountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customTipTextField.text = "15"
        setupTap()
    }

    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        
        if let amount = totalBillAmountTextField.text {
            if amount.isEmpty == true {
                let alert = UIAlertController(title: "Oops!", message: "Add an amount first!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alert, animated: true)
            } else {
                calculateTotalAmount()
            }
        }
    }
    
    @IBAction func preferredTipChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            customTipTextField.text = "15"
        case 1:
            customTipTextField.text = "18"
        default:
            customTipTextField.text = "20"
        }
    }
    
    func calculateTotalAmount() {
        let totalBillAmount = Double(totalBillAmountTextField.text!) ?? 0
//        let tipPercentage = [0.15, 0.18, 0.2]
        let finalTip = Double(customTipTextField.text!) ?? 0
        
        let tip = (totalBillAmount * finalTip) / 100
        
        let people = Double(splitTipTextField.text!) ?? 1
        let finalTotal = (totalBillAmount + tip) / people
        
        totalAmountLabel.text = "Total Bill + Tip: $" + String(format: "%.2f", finalTotal)
        
    }
    
    func setupTap() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
    }
 
//    @objc func tapPressed(tap: UITapGestureRecognizer) {
//        self.ended
//    }
}

