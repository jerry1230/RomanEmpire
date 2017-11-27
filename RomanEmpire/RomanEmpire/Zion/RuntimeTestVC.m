//
//  RuntimeTestVC.m
//  RomanEmpire
//
//  Created by Bird on 2017/10/27.
//  Copyright © 2017年 Flyingbird. All rights reserved.
//

#import "RuntimeTestVC.h"
#import "Person.h"
@interface RuntimeTestVC ()

@end

@implementation RuntimeTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    Person *zhangsan = [[Person alloc] init];
    [zhangsan testClassName];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
