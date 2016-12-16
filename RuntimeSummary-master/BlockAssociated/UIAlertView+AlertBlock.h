//
//  UIAlertView+AlertBlock.h
//  eeeeeeeeeeee
//
//  Created by Apple on 16/8/29.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (AlertBlock)<UIAlertViewDelegate>

typedef void (^AlertsuccessBlock)(NSInteger buttonIndex);

- (void)showWithBlock:(AlertsuccessBlock)block;

@end
