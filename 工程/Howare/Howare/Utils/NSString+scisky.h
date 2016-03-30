//
//  NSString+scisky.h
//  scisky
//
//  Created by 刘向宏 on 15/6/18.
//  Copyright © 2015年 刘向宏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "KeyInfo.h"

#define kErrorEmpty @"服务器返回错误"
#define kErrorConnect @"无法连接到服务器"
#define resourceSeeURL @"http://120.25.159.193/ResourceServer/"

@interface NSString (scisky)
-(NSString *)AESEncrypt;
- (NSData *) dataFromMD5;
- (NSString *)formatData;
- (BOOL)checkTel;
+ (BOOL)validateIDCardNumber:(NSString *)value;
- (BOOL)isValidateEmail;
- (NSString *)toResourceSeeURL;
-(NSString *)phoneString;
-(NSString *)pingyingFirstString;
@end

