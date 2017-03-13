//
//  BNAlertShow.m
//  BarNotification
//
//  Created by Luojianzhen on 2016/11/21.
//  Copyright © 2016年 Luojianzhen. All rights reserved.
//

#import "BNAlertShow.h"

#import "BNAlertView.h"

@interface BNAlertShow ()

@end

@implementation BNAlertShow

+ (BNAlertShow *)shared {
    static BNAlertShow *obj = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        obj = [[BNAlertShow alloc]init];
    });
    return obj;
}

- (id)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}


- (void)showByText:(NSString *)statusText withStatus :(BNStatus)st {
    
    
    NSBlockOperation *blockOp = [NSBlockOperation blockOperationWithBlock:^{
        BNAlertView *alert = [[BNAlertView alloc]initWithStatus:st];
        [alert showContentByText:statusText];
    }];
    
//    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
//    [queue setMaxConcurrentOperationCount:1];
//    [queue addOperation:blockOp];
    
    
    [[NSOperationQueue mainQueue]addOperation:blockOp];
    
}

@end
