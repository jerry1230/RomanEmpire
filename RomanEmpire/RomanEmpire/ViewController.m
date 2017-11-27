//
//  ViewController.m
//  RomanEmpire
//
//  Created by Bird on 2017/8/24.
//  Copyright © 2017年 Flyingbird. All rights reserved.
//

#import "ViewController.h"
#import "TestCenterVC.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    TestCenterVC *vc = [[TestCenterVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)showAlertWithTitle:(NSString *)str message:(NSString *)str actionTitle:(NSString *)str Block:()block
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
