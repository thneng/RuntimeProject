//
//  TViewController.m
//  Runtime_Project
//
//  Created by baoshan on 16/8/24.
//  Copyright © 2016年 kairu. All rights reserved.
//

#import "TViewController.h"

@interface TViewController ()

@end

@implementation TViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"T";
    NSLog(@"%@,%@",self.ID,self.type);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
