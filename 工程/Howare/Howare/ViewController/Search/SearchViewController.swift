//
//  SearchViewController.swift
//  Howare
//
//  Created by 刘向宏 on 16/4/5.
//  Copyright © 2016年 刘向宏. All rights reserved.
//

import UIKit

enum SearchStatusType {
    case Default
    case Searching
    case Adding
}

enum AddStatusType {
    case Init
    case Connecting
    case Failure
    case Success
}

struct DeviceModel {
    var name : String = ""
    var status : AddStatusType = .Init
}

class SearchViewController: UIViewController {

    @IBOutlet weak var searchView : UIView!
    @IBOutlet weak var lightImageView : UIImageView!
    @IBOutlet weak var radarImageView : UIImageView!
    @IBOutlet weak var deviceStatusImageView : UIImageView!
    @IBOutlet weak var searchButton : UIButton!
    @IBOutlet weak var statusLabel : UILabel!
    @IBOutlet weak var statusButton : UIButton!
    
    @IBOutlet weak var addingImageView : UIImageView!
    
    var imageviewAngle:CGFloat = 0
    var searchStatus = SearchStatusType.Default
    
    var deviceViews = [UIButton]()
    var devices = [DeviceModel]()
    
    var currentDeviceModel : DeviceModel!
    
    var timeCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        //self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction func backClick(sender : AnyObject){
        searchStatus = .Default
        updateUI()
    }
    
    @IBAction func searchClick(sender : AnyObject){
        if searchStatus == .Searching{
            return
        }
        startSearchAnimation()
        searchStatus = .Searching
        updateUI()
    }
    
    @IBAction func addClick(sneder : AnyObject){
        if currentDeviceModel.status == .Connecting {
            return
        }
        startAddingAnimation()
        currentDeviceModel.status = .Connecting
        updateAddingUI()
    }
    
    func startSearchAnimation() {
        let endAngle = CGAffineTransformMakeRotation(imageviewAngle * (CGFloat(M_PI) / 180.0));
        UIView.animateWithDuration(0.5, delay: 0, options: UIViewAnimationOptions.CurveLinear, animations: {
            self.lightImageView.transform = endAngle
        }) { (bo : Bool) in
            self.imageviewAngle += 50
            if self.searchStatus == .Searching{
                self.startSearchAnimation()
                if self.imageviewAngle % 200 == 0{
                    var model = DeviceModel()
                    model.name = "设备\(Int(self.imageviewAngle))"
                    self.devices.append(model)
                    self.reloadDevice()
                }
            }
            else{
                self.imageviewAngle = 0
                self.lightImageView.transform = CGAffineTransformMakeRotation(0);
            }
        }
    }
    
    func startAddingAnimation() {
        self.addingImageView.transform = CGAffineTransformMakeScale(0.3,0.3)
        self.addingImageView.alpha = 1
        UIView.animateWithDuration(1.4, delay: 0, options: UIViewAnimationOptions.CurveLinear, animations: {
            self.addingImageView.transform = CGAffineTransformMakeScale(1,1)
            self.addingImageView.alpha = 0
            
        }) { (bo : Bool) in
            self.timeCount += 1
            if self.timeCount == 5{
                self.currentDeviceModel.status = .Failure
                self.updateAddingUI()
            }
            else if self.timeCount == 10{
                self.currentDeviceModel.status = .Success
                self.updateAddingUI()
            }
            if self.searchStatus == .Adding && self.currentDeviceModel.status == .Connecting{
                self.startAddingAnimation()
            }
        }
    }
    
    func updateUI(){
        searchButton.hidden = self.searchStatus == .Adding
        lightImageView.hidden = self.searchStatus != .Searching
        radarImageView.highlighted = self.searchStatus == .Adding
        statusLabel.hidden = self.searchStatus != .Adding
        statusButton.hidden = self.searchStatus != .Adding
        deviceStatusImageView.hidden = self.searchStatus != .Adding
        addingImageView.hidden = true
        for i in 0 ..< deviceViews.count{
            deviceViews[i].hidden = self.searchStatus != .Searching
        }
        
        if self.searchStatus == .Adding {
            updateAddingUI()
        }
    }
    
    func updateAddingUI(){
        deviceStatusImageView.image = currentDeviceModel.status == .Success ? UIImage(named: "成功") : UIImage(named: "设备大")
        addingImageView.hidden = currentDeviceModel.status != .Connecting
        switch currentDeviceModel.status {
        case .Init:
            statusLabel.text = currentDeviceModel.name
            statusButton.setTitle(LocalizedString.Tr("配对"), forState: .Normal)
        case .Connecting:
            statusLabel.text = LocalizedString.Tr("配对中")
            statusButton.setTitle(LocalizedString.Tr("配对"), forState: .Normal)
        case .Failure:
            statusLabel.text = LocalizedString.Tr("配对失败")
            statusButton.setTitle(LocalizedString.Tr("重试"), forState: .Normal)
        case .Success:
            statusLabel.text = LocalizedString.Tr("配对成功")
            statusButton.setTitle(LocalizedString.Tr("完成"), forState: .Normal)
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    func reloadDevice(){
        
        for i in 0  ..< devices.count  {
            if i > 7 {
                break
            }
            if deviceViews.count < i + 1 {
                let btn = UIButton(type: .Custom)
                btn.setImage(UIImage(named: "设备"), forState: .Normal)
                btn.addTarget(self, action:#selector(SearchViewController.deviceClick(_:)), forControlEvents: .TouchUpInside)
                deviceViews.append(btn)
                self.searchView.addSubview(btn)
                btn.frame = CGRectMake(searchView.width/2 - 1, searchView.height/2 - 1, 2, 2)
                btn.transform = CGAffineTransformMakeScale(0.1,0.1);
                UIView.animateWithDuration(0.5, animations: {
                    btn.sizeToFit()
                    btn.transform = CGAffineTransformMakeScale(self.searchView.width/404,self.searchView.width/404);
                    let x = self.searchView.width/2 + self.searchView.width/3 * cos(CGFloat(-45 + 45 * i) * (CGFloat(M_PI) / 180.0)) - (btn.width/2 )
                    let y = self.searchView.height/2 + self.searchView.height/3 * sin(CGFloat(-45  + 45 * i) * (CGFloat(M_PI) / 180.0)) - (btn.height/2 )
                    btn.frame = CGRectMake(x, y, btn.width, btn.height)
                })
            }
            let btn = deviceViews[i]
            btn.hidden = false
            btn.tag = i
        }
        
        if deviceViews.count > devices.count{
            for j in devices.count ..< deviceViews.count{
                deviceViews[j].hidden = true
            }
        }
    }
    
    func deviceClick(sender : UIButton!) {
        searchStatus = .Adding
        currentDeviceModel = devices[sender.tag]
        updateUI()
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
