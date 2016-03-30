//
//  KeyInfo.h
//  tahwatch
//
//  Created by 刘向宏 on 16/2/28.
//  Copyright © 2016年 刘向宏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KeyInfo : NSObject
+(NSString *)TAHSessionKey;
+(NSString *)DefaultSessionKey;
+(void)setSessionKey:(NSString *)key;
@end
