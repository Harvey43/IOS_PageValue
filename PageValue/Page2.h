//
//  Page2.h
//  PageValue
//
//  Created by Dhui on 2019/4/2.
//  Copyright © 2019年 Dhui. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Page2 : UIViewController

//属性传值
@property (nonatomic , copy) NSString *passValue;

//block回调
@property (nonatomic,copy) void (^textBlock)(NSString *str);

- (void)showText1;

- (void)showText2;

- (void)showText3;

//协议传值声明代理属性和代理方法
@property(nonatomic,assign)id delegate;
-(void)passContent:(NSString *)content;
@end

NS_ASSUME_NONNULL_END
