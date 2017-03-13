//
//  BNAlertShow.h
//  BarNotification
//
//  Created by Luojianzhen on 2016/11/21.
//  Copyright © 2016年 Luojianzhen. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,BNStatus) {
    BN_SUCCESS,
    BN_WARNING,
    BN_WRONG
};

@interface BNAlertShow : NSObject

+ (BNAlertShow *)shared;

- (void)showByText:(NSString *)statusText withStatus:(BNStatus)st;
@end
