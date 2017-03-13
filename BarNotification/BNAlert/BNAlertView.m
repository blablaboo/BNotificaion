//
//  BNAlertView.m
//  BarNotification
//
//  Created by Luojianzhen on 2016/11/21.
//  Copyright © 2016年 Luojianzhen. All rights reserved.
//

#import "BNAlertView.h"

#define DEFAULTHEIGHT 64

#define WINDOW_WIDTH [UIScreen mainScreen].bounds.size.width

#define MAX_WIDTH [UIScreen mainScreen].bounds.size.width - 20

#define COLOR(R,G,B) [UIColor colorWithRed:R/255. green:G/255. blue:B/255. alpha:1]

#define ANIMATION_DURING 0.3
#define STAY_DURING 3

@interface BNAlertView()

@property (nonatomic,strong)UILabel *contentLb;


@end

@implementation BNAlertView

- (id)initWithStatus:(NSInteger)statusCode {
    self = [super initWithFrame:CGRectMake(0, -DEFAULTHEIGHT, [UIScreen mainScreen].bounds.size.width, DEFAULTHEIGHT)];
    if (self) {
        [self configColor:statusCode];
        
        self.contentLb = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, [UIScreen mainScreen].bounds.size.width - 20, self.frame.size.height - 20)];
        
        self.contentLb.textAlignment = NSTextAlignmentCenter;
        self.contentLb.numberOfLines = 0;
        self.contentLb.textColor = [UIColor whiteColor];
        
        [self addSubview:self.contentLb];
        
    }
    return self;
}

- (void)configColor:(NSInteger)colorcode {
    switch (colorcode) {
        case 0:
            self.backgroundColor = COLOR(7, 219, 87);
            break;
        case 1:
            self.backgroundColor = COLOR(252, 202, 50);
            break;
        case 2:
            self.backgroundColor = COLOR(248, 0, 0);
            break;
        default:
            break;
    }
}

- (void)showContentByText:(NSString *)text {
    NSDictionary *attribute = @{NSFontAttributeName:[UIFont systemFontOfSize:16]};
    CGRect rect = [text boundingRectWithSize:CGSizeMake(MAX_WIDTH, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil];
    if (rect.size.height > DEFAULTHEIGHT) {
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, WINDOW_WIDTH, rect.size.height + 20);
        self.contentLb.frame = CGRectMake(self.contentLb.frame.origin.x, self.contentLb.frame.origin.y, self.contentLb.frame.size.width, rect.size.height);
    }
    self.contentLb.text = text;
    
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
    [UIView animateWithDuration:ANIMATION_DURING delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        self.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        
    } completion:^(BOOL finished) {
        
        [self performSelector:@selector(dismissSelf) withObject:nil afterDelay:STAY_DURING];
        
    }];
    
}

- (void)dismissSelf {
    
    [UIView animateWithDuration:ANIMATION_DURING delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.frame = CGRectMake(0, -self.frame.size.height, self.frame.size.width, self.frame.size.height);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
}


@end
