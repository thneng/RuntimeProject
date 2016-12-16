//
//  ViewController.m
//  BlockAssociated
//
//  Created by kairu on 16/11/21.
//  Copyright © 2016年 Tuccuay. All rights reserved.
//

#import "ViewController.h"
#import "UIAlertView+AlertBlock.h"
#import "UIButton+BtnBlock.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //alert
    UIAlertView *alertTest = [[UIAlertView alloc] initWithTitle:@"测试" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alertTest showWithBlock:^(NSInteger buttonIndex) {
        NSLog(@"++++++++%ld+++++",(long)buttonIndex);
    }];
    [alertTest show];
    
    //btn
    UIButton *btnTest = [UIButton buttonWithType:UIButtonTypeCustom];
    btnTest.frame = CGRectMake(100, 100, 200, 200);
    btnTest.backgroundColor = [UIColor redColor];
    [btnTest handelWithBlock:^{
        NSLog(@"++++++++按钮被点击了+++++");
    }];
    [self.view addSubview:btnTest];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
