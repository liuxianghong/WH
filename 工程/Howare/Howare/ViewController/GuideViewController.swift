//
//  GuideViewController.swift
//  tahwatch
//
//  Created by 刘向宏 on 16/2/23.
//  Copyright © 2016年 刘向宏. All rights reserved.
//

import UIKit

class GuideViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var pageContorl : UIPageControl!
    @IBOutlet weak var scrollView : UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction func jumpClick(sender : AnyObject){
        //self.dismissViewControllerAnimated(true, completion: nil)
        self.performSegueWithIdentifier("qrcodeidentfier", sender: nil)
        let gude = NSBundle.mainBundle().objectForInfoDictionaryKey(kCFBundleVersionKey as String) as! String
        NSUserDefaults.standardUserDefaults().setObject(gude, forKey: "gude")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        pageContorl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
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
