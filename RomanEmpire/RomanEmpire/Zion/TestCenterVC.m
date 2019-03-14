//
//  TestCenterVC.m
//  RomanEmpire
//
//  Created by Flying on 2017/11/27.
//  Copyright © 2017年 Flyingbird. All rights reserved.
//

#import "TestCenterVC.h"
#import "CellAnmiationTestVC.h"
#import "MultithreadingTestVC.h"
#import "RectProgressVC.h"

@interface TestCenterVC ()
@end

@implementation TestCenterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"TestCenterVC";
    
    UIButton *btn  =  [UIButton buttonWithType:UIButtonTypeSystem];
    btn.bounds = CGRectMake(self.view.center.x, self.view.center.y, 100, 100);
    btn.center = self.view.center;

    [btn setTitle:@"Test" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(testBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:@"1",@"2",@"3", nil];
//    NSString *str = array[0];
    [array removeObjectAtIndex:0];
//    NSLog(@"%@",str);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)testBtnAction
{
//    CellAnmiationTestVC *vc = [[CellAnmiationTestVC alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];
    
//    MultithreadingTestVC *vc = [[MultithreadingTestVC alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];
    
    RectProgressVC *vc = [[RectProgressVC alloc] initWithNibName:@"RectProgressVC" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
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
