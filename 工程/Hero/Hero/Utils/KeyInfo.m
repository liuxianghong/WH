//
//  KeyInfo.m
//  tahwatch
//
//  Created by 刘向宏 on 16/2/28.
//  Copyright © 2016年 刘向宏. All rights reserved.
//

#import "KeyInfo.h"

@implementation KeyInfo

static NSString *sessionKey = @"9d1aad09";

+(NSString *)TAHSessionKey{
    return [self DefaultSessionKey];
    return sessionKey;
}

+(void)setSessionKey:(NSString *)key{
    sessionKey = [key copy];
}

+(NSString *)DefaultSessionKey{
    return @"9d1aad09";
}

@end
