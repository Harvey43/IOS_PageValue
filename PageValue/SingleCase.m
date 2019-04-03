//
//  SingleCase.m
//  PageValue
//
//  Created by Dhui on 2019/4/2.
//  Copyright © 2019年 Dhui. All rights reserved.
//

#import "SingleCase.h"

@implementation SingleCase

+(instancetype)sharedInstance {
    static SingleCase *shareInfo = nil;
    if (shareInfo == nil) {
        shareInfo = [[SingleCase alloc] init];
    }
    return shareInfo;
}


@end
