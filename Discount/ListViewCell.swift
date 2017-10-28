//
//  ListViewCell.swift
//  Discount
//
//  Created by Taichi Tsuchida on 2017/10/28.
//  Copyright © 2017年 Taichi Tsuchida. All rights reserved.
//

import UIKit

class ListViewCell: UITableViewCell {

    @IBOutlet var resultLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
