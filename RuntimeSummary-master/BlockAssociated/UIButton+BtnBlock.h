//
//  UIButton+BtnBlock.h
//  eeeeeeeeeeee
//
//  Created by Apple on 16/8/29.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^btnBlock)();
@interface UIButton (BtnBlock)
- (void)handelWithBlock:(btnBlock)block;
@end
