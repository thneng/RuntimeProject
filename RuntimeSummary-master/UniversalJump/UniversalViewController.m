//
//  ViewController.m
//  Runtime_Project
//
//  Created by baoshan on 16/8/24.
//  Copyright © 2016年 kairu. All rights reserved.
//

#import "UniversalViewController.h"
#import <objc/runtime.h>

NSString *const classKey = @"classKey";
NSString *const propertyKey = @"propertyKey";

@interface UniversalViewController ()

@property (weak, nonatomic) IBOutlet UIButton *pushButton;

@end

@implementation UniversalViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setupView];
    self.title = @"万能跳转";
}

/**
 *  配置视图
 */
- (void) setupView {

    //添加selector
    [_pushButton addTarget:self action:@selector(pushButtonAction:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - 触发事件

/**
 *  ButtonAction
 */
- (void)pushButtonAction:(UIButton *)button{

    [self pushNextController:@{classKey:@"TViewController",
                                propertyKey:@{@"ID":@"1",
                                             @"type":@"nice"}}];
}

/**
 *  万能跳转器
 */
- (void)pushNextController:(NSDictionary *)pushInfo{

    NSString *classValue = pushInfo[classKey];
    const char *className = [classValue cStringUsingEncoding:NSASCIIStringEncoding];
    Class newClass = objc_getClass(className);
    if (!newClass) {
        
        //创建一个类
        Class superClass = [NSObject class];
        newClass = objc_allocateClassPair(superClass, className, 0);
        
        //注册创建的这个类
        objc_registerClassPair(newClass);
    }
    
    //创建对象
    id instance = [[newClass alloc] init];
    
    //对该对象赋值属性
    NSDictionary *properties = pushInfo[propertyKey];
    [properties enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        if ([self checkPropertyWithInstance:instance propertyName:key]) {
            
            //kvc赋值
            [instance  setValue:obj forKey:key];
        }
    }];
    
   
    [self.navigationController pushViewController:instance animated:NO];
}


#pragma mark - 辅助方法
/**
 *  检测对象是否存在该属性
 */
- (bool)checkPropertyWithInstance:(id)instance propertyName:(NSString *)transPropertyName{

    unsigned int outCount, i;
    
    // 获取对象里的属性列表
    objc_property_t * properties = class_copyPropertyList([instance class],
                                                          &outCount);
    
    for (i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        //  属性名转成字符串
        NSString *realPropertyName = [[NSString alloc] initWithCString:property_getName(property)
                                                          encoding:NSUTF8StringEncoding];
        // 判断该属性是否存在
        if ([realPropertyName isEqualToString:transPropertyName]) {
            free(properties);
            return true;
        }
    }
    free(properties);
    
    return false;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
