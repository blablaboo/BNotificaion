//
//  BNAlertView.h
//  BarNotification
//
//  Created by Luojianzhen on 2016/11/21.
//  Copyright © 2016年 Luojianzhen  All rights reserved.
//

#import <UIKit/UIKit.h>



@interface BNAlertView : UIView

- (id)initWithStatus:(NSInteger)statusCode;

- (void)showContentByText:(NSString *)text;



@end
