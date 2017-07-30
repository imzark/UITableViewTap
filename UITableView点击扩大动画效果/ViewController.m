//
//  ViewController.m
//  UITableView点击扩大动画效果
//
//  Created by Zark on 2017/7/30.
//  Copyright © 2017年 Zarky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self configTableView];
    
    [self.view addSubview:self.tableView];
    
    _dataSource = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10"];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configTableView {
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = ({
            
            UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
            //            tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
            tableView.backgroundColor = [UIColor orangeColor];
            
            //            UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
            //            UIVibrancyEffect *vibrancyEffect = [UIVibrancyEffect effectForBlurEffect:blurEffect];
            
            //            tableView.separatorEffect = blurEffect;
            
            tableView.delegate = self;
            tableView.dataSource = self;
            
            tableView.tableFooterView = [[UIView alloc] init];
            
            tableView;
        });
    }
    return _tableView;
}

#pragma mark - UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //        _tableView.rowHeight = 100;
    UITableViewCell *cell = [_tableView cellForRowAtIndexPath:indexPath];
    if ([cell.textLabel.text isEqualToString:@"我草！"]) {
        cell.textLabel.text = _dataSource[indexPath.row];
    } else {
        cell.textLabel.text = @"我草！";
    }

    CGRect frame = cell.frame;
    frame.origin.y -= 20;
    frame.size.height += 40;
    cell.frame = frame;
    
    [_tableView beginUpdates];
    [_tableView endUpdates];
    
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - UITableView Datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = _dataSource[indexPath.row];
    cell.textLabel.textColor =[UIColor whiteColor];
    return cell;
}

@end
