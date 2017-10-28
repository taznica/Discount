//
//  Discount.swift
//  Discount
//
//  Created by Taichi Tsuchida on 2017/10/28.
//  Copyright © 2017年 Taichi Tsuchida. All rights reserved.
//

import Foundation

class Data {
    var discounts: [Int]
    
    init(discounts: [Int]) {
        self.discounts = discounts
    }
}

class Discount: NSObject {
    var data = Data(discounts: [])
    
    static let shared = Discount()
    private override init() {}
    
    func saveDiscounts(discounts: [Int]) {
        data.discounts = discounts
    }
    
    func getDiscounts() -> [Int] {
        return data.discounts
    }
    
    func deleteDiscount(index: Int) {
        data.discounts.remove(at: index)
    }
    
    func clearDiscounts() {
        data.discounts.removeAll()
    }
}
