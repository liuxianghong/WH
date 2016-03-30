//
//  ViewController.m
//  Howare
//
//  Created by 刘向宏 on 16/3/29.
//  Copyright © 2016年 刘向宏. All rights reserved.
//

#import "ViewController.h"
#import <CoreTelephony/CTCallCenter.h>
#import <CoreTelephony/CTCall.h>

#import <WYPopoverController/WYPopoverController.h>

@interface ViewController ()

@end

@implementation ViewController{
    CTCallCenter *callCenter;
    WYPopoverController *popoverController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    callCenter = [[CTCallCenter alloc] init];
    callCenter.callEventHandler = ^(CTCall* call) {
        if ([call.callState isEqualToString:CTCallStateDisconnected])
        {
            NSLog(@"Call has been disconnected");
        }
        else if ([call.callState isEqualToString:CTCallStateConnected])
        {
            NSLog(@"Call has just been connected");
        }
        else if([call.callState isEqualToString:CTCallStateIncoming])
        {
            NSLog(@"Call is incoming");
        }
        else if ([call.callState isEqualToString:CTCallStateDialing])
        {
            NSLog(@"call is dialing");
        }
        else
        {  
            NSLog(@"Nothing is done");
        }  
    };
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    UIViewController *settingsViewController = [UIViewController new];
    settingsViewController.preferredContentSize = CGSizeMake(self.view.frame.size.width/2, self.view.frame.size.width/2);
    popoverController = [[WYPopoverController alloc] initWithContentViewController:settingsViewController];
    //[popoverController presentPopoverAsDialogAnimated:YES options:WYPopoverAnimationOptionScale];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
