//
//  ViewController.m
//  BarNotification
//
//  Created by Luojianzhen on 2016/11/21.
//  Copyright © 2016年 Luojianzhen. All rights reserved.
//

#import "ViewController.h"
#import "BNAlertShow.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self performSelector:@selector(show) withObject:nil afterDelay:2];
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)showAlert:(id)sender {
    [self show];
}



- (void)show {
    [[BNAlertShow shared]showByText:@"网络链接错误,网络链接错误,网络链接错误,网络链接错误,网络链接错误,网络链接错误,网络链接错误,网络链接错误,网络链接错误,网络链接错误,网络链接错误,网络链接错误,网络链接错误,网络链接错误,网络链接错误,网络链接错误," withStatus:BN_SUCCESS];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
