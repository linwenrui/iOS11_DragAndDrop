//
//  ViewController.m
//  iOS11_DragAndDrop
//
//  Created by LWR on 2017/11/5.
//  Copyright © 2017年 lwr. All rights reserved.
//

#import "ViewController.h"

static NSString *const identifier = @"cellIdentifier";

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor redColor];

    [self setupNav];
    [self setupTableView];
}

- (void)setupNav {

    self.navigationController.navigationBar.largeTitleTextAttributes = @{
                                                                         NSFontAttributeName : [UIFont fontWithName:@"PingFangSC-Medium" size:28],
                                                                         NSForegroundColorAttributeName : [UIColor orangeColor]
                                                                         };
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    self.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeAutomatic;
}

- (void)setupTableView {

    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
    _tableView.rowHeight = 60;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

#pragma mark - UITableViewDelegate && UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    NSDictionary *dic = self.dataSource[indexPath.row];
    cell.textLabel.text = dic[@"title"];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSDictionary *dic = self.dataSource[indexPath.row];
    [self.navigationController pushViewController:[[NSClassFromString(dic[@"vc"]) alloc] init] animated:YES];
}

#pragma mark - getter & setter

- (NSArray *)dataSource {

    if (!_dataSource) {

        _dataSource = @[@{@"title" : @"UICollectionView-Drag & Drop", @"vc" : @"DragCollectionViewController"}, @{@"title" : @"UITableView-Drag & Drop", @"vc" : @"DragTableViewController"}, @{@"title" : @"UIView-Drag & Drop", @"vc" : @"NormalDragViewController"}, @{@"title" : @"UITableView Swipe手势新特性", @"vc" : @"SwipeViewController"}];
    }
    return _dataSource;
}

@end
