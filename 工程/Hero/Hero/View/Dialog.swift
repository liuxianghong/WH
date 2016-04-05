//
//  Dialog.swift
//  Hero
//
//  Created by 刘向宏 on 16/4/1.
//  Copyright © 2016年 刘向宏. All rights reserved.
//

import UIKit

enum DialogType {
    case Default
    case OnlyOK
    case NoBtton
}


class Dialog: UIView {

    @IBOutlet weak var contentView : UIView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.clearColor()
        //loadViews(.Default)
    }
    
    func loadViews(type : DialogType)  {
        if contentView != nil {
            contentView.removeFromSuperview()
        }
        NSBundle.mainBundle().loadNibNamed("Dialog", owner: self, options: nil)
        self.addSubview(contentView)
        layer.cornerRadius = 4
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if contentView != nil {
            contentView.frame = self.bounds
        }
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
