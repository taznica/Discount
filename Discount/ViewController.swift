//
//  ViewController.swift
//  Discount
//
//  Created by Taichi Tsuchida on 2017/10/28.
//  Copyright © 2017年 Taichi Tsuchida. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var priceField: UITextField!
    @IBOutlet var rateField: UITextField!
    @IBOutlet var taxSegment: UISegmentedControl!
    @IBOutlet var rateSegment: UISegmentedControl!
    @IBOutlet var rateLabel: UILabel!
    @IBOutlet var discountLabel: UILabel!
    
    @IBOutlet var calcButton: UIButton!
    @IBOutlet var addButton: UIButton!
    @IBOutlet var clearButton: UIButton!

    var discount: Int = 0
    var discounts: [Int] = []
    
    let shared = Discount.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        calcButton.layer.cornerRadius = 20
        addButton.layer.cornerRadius = 20
        clearButton.layer.cornerRadius = 20
        
        priceField.delegate = self
        rateField.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        discounts = shared.getDiscounts()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func didSelectCalc() {
        guard let priceText = priceField.text else {
            return
        }

        guard let rateText = rateField.text else {
            return
        }

        var price: Float = Float(priceText)!
        let rate: Float = Float(rateText)!
        
        var tax: Float!
        var rateType: Float!
        
        switch taxSegment.selectedSegmentIndex {
        case 0:
            tax = 1.0
        case 1:
            tax = 1.08
        default:
            tax = 1.0
        }
        
        price = price * tax
        
        switch rateSegment.selectedSegmentIndex {
        case 0:
            rateType = 100
        case 1:
            rateType = 10
        default:
            rateType = 100
        }

        let discountRate: Float = 1 - (rate / rateType)

        let result: Float = price * discountRate

        discount = Int(result)

        discountLabel.text = String(discount)
    }
    
    @IBAction func switchType(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            rateLabel.text = "%引"
        case 1:
            rateLabel.text = "割引"
        default:
            rateLabel.text = "%引"
        }
    }
    
    @IBAction func didSelectAddList() {
        discounts.append(discount)
        shared.saveDiscounts(discounts: discounts)
    }
    
    @IBAction func didSelectClear() {
        priceField.text = ""
        rateField.text = ""
        discountLabel.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

