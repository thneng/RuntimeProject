//
//  UIButton+BtnBlock.m
//  eeeeeeeeeeee
//
//  Created by Apple on 16/8/29.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "UIButton+BtnBlock.h"
#import <objc/runtime.h>

static const char btnKey;

@implementation UIButton (BtnBlock)

- (void)handelWithBlock:(btnBlock)block
{
    if (block)
    {
        objc_setAssociatedObject(self, &btnKey, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    [self addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnAction
{
    btnBlock block = objc_getAssociatedObject(self, &btnKey);
    block();
}
@end
