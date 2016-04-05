//
//  HomeSetTableViewCell.swift
//  Howare
//
//  Created by 刘向宏 on 16/4/5.
//  Copyright © 2016年 刘向宏. All rights reserved.
//

import UIKit

class HomeSetTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel : UILabel!
    @IBOutlet weak var openSwith : UISwitch!
    @IBOutlet weak var headImageView : UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func switchClick(sender : UISwitch!){
    }

}
