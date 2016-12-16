//
//  UIAlertView+AlertBlock.m
//  eeeeeeeeeeee
//
//  Created by Apple on 16/8/29.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "UIAlertView+AlertBlock.h"
#import <objc/runtime.h>

static const char alertKey;

@implementation UIAlertView (AlertBlock)

- (void)showWithBlock:(AlertsuccessBlock)block
{
    if (block)
    {
        objc_setAssociatedObject(self, &alertKey, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        self.delegate = self;
    }
    
    [self show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    AlertsuccessBlock block = objc_getAssociatedObject(self, &alertKey);
    
    block(buttonIndex);
}
@end
