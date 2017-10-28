//
//  ListViewController.swift
//  Discount
//
//  Created by Taichi Tsuchida on 2017/10/28.
//  Copyright © 2017年 Taichi Tsuchida. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var listView: UITableView!
    @IBOutlet var totalLabel: UILabel!
    
    let shared = Discount.shared
    var discounts: [Int] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listView.register(UINib(nibName: "ListViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        
        listView.delegate = self
        listView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        discounts = shared.getDiscounts()
        
        getTotal(array: discounts)
        
        listView.reloadData()
    }
    
    func getTotal(array: [Int]) {
        var total: Int = 0
        
        for i in array {
            total = total + i
        }
        
        totalLabel.text = String(total)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //    @IBAction func clearAll() {
    //        shared.clearDiscounts()
    //        totalLabel.text = ""
    //        listView.reloadData()
    //    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return discounts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ListViewCell
        cell.resultLabel.text = String(discounts[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
//    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
//        let deleteButton: UITableViewRowAction = UITableViewRowAction(style: .normal, title: "削除") {
//            (action, index) -> Void in
//
//            tableView.deleteRows(at: [indexPath], with: .fade)
//            self.getTotal(array: self.discounts)
//            self.listView.reloadData()
//
//        }
//        deleteButton.backgroundColor = UIColor.red
//
//        return [deleteButton]
//    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            discounts = shared.getDiscounts()
            discounts.remove(at: indexPath.row)
            shared.saveDiscounts(discounts: discounts)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
