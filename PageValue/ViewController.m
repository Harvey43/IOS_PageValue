//
//  ViewController.m
//  PageValue
//
//  Created by Dhui on 2019/4/2.
//  Copyright © 2019年 Dhui. All rights reserved.
//

#import "ViewController.h"
#import "Page2.h"
#import "SingleCase.h"

@interface ViewController ()<UITextFieldDelegate>{
    NSString *text;
}


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeText:) name:@"KPassValue" object:nil];
}


- (void)changeText:(NSNotification *)noti{
    NSDictionary *dic = noti.object;

    UILabel *lbl = [self.view viewWithTag:101];
    lbl.text = [dic objectForKey:@"passValue"];
}


- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    text = [textField.text stringByReplacingCharactersInRange:range withString:string];
    return YES;
}


- (IBAction)btnAllAction:(id)sender{
    UIButton *btn = sender;
    Page2 *pageVC = [[Page2 alloc] init];
    switch (btn.tag) {
        case 201:{//属性传值
            pageVC.passValue = text;
            [pageVC showText1];
        }
            break;
        case 202:{//单例传值
            [SingleCase sharedInstance].info = text;
            [pageVC showText2];
        }
            break;
        case 203:{//NSUserDefault传值
            [[NSUserDefaults standardUserDefaults] setValue:text forKey:@"PassValue"];
            [pageVC showText3];
        }
            break;
        default:
            break;
    }
    //block传值接收
    pageVC.textBlock = ^(NSString * _Nonnull str) {
        UILabel *lbl = [self.view viewWithTag:101];
        lbl.text = str;
    };
    //协议传值接收
    pageVC.delegate = self;
    [self presentViewController:pageVC animated:YES completion:nil];
}

-(void)passContent:(NSString*)content{
    UILabel *lbl = [self.view viewWithTag:101];
    lbl.text = content;
}


@end
