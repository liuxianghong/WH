//
//  BindViewController.swift
//  Hero
//
//  Created by 刘向宏 on 16/4/1.
//  Copyright © 2016年 刘向宏. All rights reserved.
//

import UIKit

class BindViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func noDeviceClick(sender : AnyObject?){
        self.performSegueWithIdentifier("dialogIndetifier", sender: nil)
    }
    
    @IBAction func haveDeviceClick(sender : AnyObject?){
        self.performSegueWithIdentifier("loginIdentifier", sender: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
