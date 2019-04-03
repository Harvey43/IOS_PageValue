//
//  SingleCase.h
//  PageValue
//
//  Created by Dhui on 2019/4/2.
//  Copyright © 2019年 Dhui. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SingleCase : NSObject
@property (nonatomic,copy) NSString *info;   //这是就是用来传值用的属性，想传什么值，就先赋值给它，相当于中介

+(instancetype)sharedInstance;   //共享单例的方法
@end

NS_ASSUME_NONNULL_END
