//
//  Page2.m
//  PageValue
//
//  Created by Dhui on 2019/4/2.
//  Copyright © 2019年 Dhui. All rights reserved.
//

#import "Page2.h"
#import "ViewController.h"
#import "SingleCase.h"

@interface Page2 ()<UITextFieldDelegate>{
    NSString *text;
}

@end

@implementation Page2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)showText1{
    UILabel *lbl = [self.view viewWithTag:101];
    lbl.text = _passValue;
}

- (void)showText2{
    UILabel *lbl = [self.view viewWithTag:101];
    lbl.text = [SingleCase sharedInstance].info;
}

- (void)showText3{
    NSString *str = nil;
    if ([[NSUserDefaults standardUserDefaults] valueForKey:@"PassValue"]) {
        str = [[NSUserDefaults standardUserDefaults] valueForKey:@"PassValue"];
    }
    UILabel *lbl = [self.view viewWithTag:101];
    lbl.text = str;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    text = [textField.text stringByReplacingCharactersInRange:range withString:string];
    return YES;
}

- (IBAction)btnAllAction:(id)sender{
    UIButton *btn = sender;
    switch (btn.tag) {
        case 204:{//协议传值
            [_delegate passContent:text];
            [self dismissViewControllerAnimated:YES completion:nil];
        }
            break;
        case 205:{//Block传值
            self.textBlock(text);
            [self dismissViewControllerAnimated:YES completion:nil];
        }
            break;
        case 206:{//通知传值
            [[NSNotificationCenter defaultCenter] postNotificationName:@"KPassValue" object:@{@"passValue":text}];
            [self dismissViewControllerAnimated:YES completion:nil];
        }
            break;
        default:
            break;
    }
}
@end
