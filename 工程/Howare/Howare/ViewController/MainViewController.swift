//
//  MainViewController.swift
//  Howare
//
//  Created by 刘向宏 on 16/3/30.
//  Copyright © 2016年 刘向宏. All rights reserved.
//

import UIKit

class MainViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //UINavigationBar.appearance().setBackgroundImage(UIImage(named: "导航栏"), forBarMetrics: .Default)
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        var showGude = true
        if let gudeVerson = NSUserDefaults.standardUserDefaults().objectForKey("gude") as? String{
            let gude = NSBundle.mainBundle().objectForInfoDictionaryKey(kCFBundleVersionKey as String) as! String
            if gudeVerson == gude{
                showGude = false
            }
        }
        showGude = true
        if showGude{
            self.performSegueWithIdentifier("guideIdentifier", sender: nil)
            return;
        }
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
