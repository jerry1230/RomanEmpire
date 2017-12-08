//
//  CellAnmiationTestVC.m
//  RomanEmpire
//
//  Created by Flying on 2017/12/4.
//  Copyright © 2017年 Flyingbird. All rights reserved.
//

#import "CellAnmiationTestVC.h"

@interface CellAnmiationTestVC ()   <UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataArr;
@property(nonatomic,strong)NSMutableArray *curdataArr;

@property(nonatomic,strong)NSMutableArray *indesPaths;
@property (nonatomic,assign)int DatNum;
@property(nonatomic,strong) NSTimer * timer;
@end

@implementation CellAnmiationTestVC
/*
 
 Objective-C
 
 [CATransaction begin];
 [tableView beginUpdates];
 [CATransaction setCompletionBlock: ^{
 // Code to be executed upon completion
 }];
 [tableView insertRowsAtIndexPaths: indexPaths
 withRowAnimation: UITableViewRowAnimationAutomatic];
 [tableView endUpdates];
 [CATransaction commit];
 Swift
 
 CATransaction.begin()
 tableView.beginUpdates()
 CATransaction.setCompletionBlock {
 // Code to be executed upon completion
 }
 tableView.insertRowsAtIndexPaths(indexArray, withRowAnimation: .Top)
 tableView.endUpdates()
 CATransaction.commit()
 
 */


-(UITableView *)tableView{
    if (!_tableView) {
        CGRect frame = CGRectMake(self.view.frame.origin.x, 64, self.view.bounds.size.width, self.view.bounds.size.height-114);
        _tableView = [[UITableView alloc]initWithFrame:frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    }
    return _tableView;
}
-(NSArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [[NSMutableArray alloc] initWithObjects:@"我是个1",
                                                             @"我是个2",
                                                             @"我是个3",
                                                             @"我是个4",
                                                             @"我是个5",
                                                             @"我是个6",
                                                             @"我是个7",
                                                             @"我是个8",
                                                             @"我是个9",
                                                             @"我是个10",
                                                             @"我是个11",
                                                             @"我是个12",
                                                             @"我是个13",
                                                             @"我是个14",
                                                             @"我是个15", nil];
    }
    return _dataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _curdataArr = [[NSMutableArray alloc] initWithObjects:@"我是个1",@"我是个2",nil];
    self.title = @"CellAnmiationTestVC";
    UIButton *btn  =  [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y+self.view.bounds.size.height-50, self.view.bounds.size.width/2, 50);
    [btn setTitle:@"Test1" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(testBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn2  =  [UIButton buttonWithType:UIButtonTypeSystem];
    btn2.frame = CGRectMake(self.view.bounds.size.width/2, self.view.frame.origin.y+self.view.bounds.size.height-50, self.view.bounds.size.width/2, 50);
    [btn2 setTitle:@"Test2" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(testBtn2Action) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.tableView];
    self.DatNum = -1;
    NSMutableArray *indexPaths = @[].mutableCopy;
    self.indesPaths = indexPaths;
//    self.timer =  [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(charusell) userInfo:nil repeats:YES];
}

- (void)testBtnAction
{
    NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:[NSIndexPath indexPathForItem:0 inSection:0], nil];
//    [self.curdataArr removeObjectAtIndex:0];
//    [self.tableView deleteRowsAtIndexPaths:array withRowAnimation:UITableViewRowAnimationLeft];
//    [self.curdataArr addObject:@"我是个3"];
//    [self.tableView insertRowsAtIndexPaths:array withRowAnimation:UITableViewRowAnimationRight];
    
//    - (void)reloadRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation NS_AVAILABLE_IOS(3_0);
    [self.curdataArr replaceObjectAtIndex:0 withObject:@"我是个15"];
    [self.tableView reloadRowsAtIndexPaths:array withRowAnimation:UITableViewRowAnimationLeft];
}

- (void)testBtn2Action
{
    [self.tableView reloadData];
}

-(void)charusell{
    if (self.DatNum < self.dataArr.count) {
        [self.indesPaths addObject:[NSIndexPath indexPathForItem:self.DatNum inSection:0]];
        [self.tableView insertRowsAtIndexPaths:self.indesPaths withRowAnimation:UITableViewRowAnimationRight];
        [self.indesPaths removeAllObjects];
    }else{
        [self.timer invalidate];
        //记得当不用这个定时器的时候要销毁.
        self.timer = nil;
    }
    self.DatNum = self.DatNum +1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_curdataArr count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = self.curdataArr[indexPath.row];
    
    return cell;
}
@end

