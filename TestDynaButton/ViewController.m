//
//  ViewController.m
//  TestDynaButton
//
//  Created by Zin_戦 on 2017/7/27.
//  Copyright © 2017年 Zin_戦. All rights reserved.
//
#define WINDOW_HEIGHT               [UIScreen mainScreen].bounds.size.height
#define WINDOW_WIDTH                [UIScreen mainScreen].bounds.size.width

#import "ViewController.h"
#import "UIView+Extension.h"
#import "ActivityTagView.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    ActivityTagView *aView;
}
@property(nonatomic, strong) UIButton   *tempButton;
@property (nonatomic ,strong)UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self tableView];
    aView = [[ActivityTagView alloc] init];
    self.tableView.tableHeaderView = aView;
}


-(void)noti2:(NSNotification *)noti
{
    NSString *info = [noti object];
    
    aView.height = info.floatValue;
    self.tableView.tableHeaderView = aView;
}

#pragma mark lazy loading...
-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

#pragma tableView--delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identify = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identify];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行",indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSArray *ar = [NSArray arrayWithObjects:@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1", nil];

    aView.arr = ar;
    [aView setUPView];
    self.tableView.tableHeaderView = aView;
}


@end
