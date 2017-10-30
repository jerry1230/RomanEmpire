//
//  ViewController.m
//  RomanEmpire
//
//  Created by Bird on 2017/8/24.
//  Copyright © 2017年 Flyingbird. All rights reserved.
//

#import "ViewController.h"
#import "RuntimeTestVC.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    RuntimeTestVC *vc = [[RuntimeTestVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];


}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
