//
//  ViewController.m
//  FullscreenPanGeusture
//
//  Created by kairu on 16/11/21.
//  Copyright © 2016年 Tuccuay. All rights reserved.
//

#import "ViewController.h"
#import "PushViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)push:(UIButton *)sender {
    
    PushViewController *pushVC = [[PushViewController alloc] init];
    
    [self.navigationController pushViewController:pushVC animated:YES];
}


@end
