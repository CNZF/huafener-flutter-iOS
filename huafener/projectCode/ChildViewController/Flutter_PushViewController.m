//
//  Flutter_PushViewController.m
//  huafener
//
//  Created by 杨俊杰 on 2020/3/23.
//  Copyright © 2020 杨俊杰. All rights reserved.
//

#import "Flutter_PushViewController.h"

@interface Flutter_PushViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *datas;


@end

@implementation Flutter_PushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.datas = @[@"SectionA,路由跳转，会造成大量内存泄露",
                   @"SectionB,路由跳转，会造成大量内存泄露"];
    [self.view addSubview:self.tableView];
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:(UITableViewStylePlain)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
    }
    return _tableView;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"CELL"];
        cell.textLabel.text = self.datas[indexPath.row];
    }
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datas.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:{
            FlutterViewController *fVC = [[FlutterViewController alloc] initWithProject:nil nibName:nil bundle:nil];
            [fVC setInitialRoute:@"sectionA"];
            [self.navigationController pushViewController:fVC animated:YES];
           }
               
               break;
       case 1:{
           FlutterViewController *fVC = [[FlutterViewController alloc] initWithProject:nil nibName:nil bundle:nil];
           [fVC setInitialRoute:@"sectionB"];
           [self.navigationController pushViewController:fVC animated:YES];
       }
               
               break;
           default:
               break;
       }
}

@end
