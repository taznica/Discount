//
//  ViewController.swift
//  Discount
//
//  Created by Taichi Tsuchida on 2017/10/28.
//  Copyright © 2017年 Taichi Tsuchida. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var priceField: UITextField!
    @IBOutlet var ratioField: UITextField!
    @IBOutlet var zeiSegment: UISegmentedControl!
    @IBOutlet var ratioSegment: UISegmentedControl!
    @IBOutlet var ratioLabel: UILabel!
    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func discount() {
        var price: Float = Float(priceField.text!)!
        let ratio: Float = Float(ratioField.text!)!
        
        var zei: Float!
        var ratioType: Float!
        
        switch zeiSegment.selectedSegmentIndex {
        case 0:
            zei = 1.0
        case 1:
            zei = 1.08
        default:
            zei = 1.0
        }
        
        price = price * zei
        
        switch ratioSegment.selectedSegmentIndex {
        case 0:
            ratioType = 100
        case 1:
            ratioType = 10
        default:
            ratioType = 100
        }
        
        
        let discount: Float = 1 - (ratio / ratioType)
    
        let result: Float = price * discount
        
        resultLabel.text = String(Int(result))
    }
    
    @IBAction func switchType(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            ratioLabel.text = "%引"
        case 1:
            ratioLabel.text = "割引"
        default:
            ratioLabel.text = "%引"
        }
    }
    
}

