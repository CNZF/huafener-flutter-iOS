//
//  HPHomeVCTableViewDelegate.m
//  huafener
//
//  Created by 杨俊杰 on 2020/3/23.
//  Copyright © 2020 杨俊杰. All rights reserved.
//

#import "HPHomeVCTableViewDelegate.h"
#import "Flutter_PushViewController.h"
#import "Flutter_PassByValueViewController.h"
#import "FlutterListViewController.h"

@implementation HPHomeVCTableViewDelegate

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
            Flutter_PushViewController * controller = [[Flutter_PushViewController alloc] init];
            [self.presentVC.navigationController pushViewController:controller animated:YES];
        }
            
            break;
        case 1:{
            Flutter_PassByValueViewController * controller = [[Flutter_PassByValueViewController alloc] init];
            [self.presentVC.navigationController pushViewController:controller animated:YES];
            break;
        }
        case 2:{
            FlutterListViewController *controller = [[FlutterListViewController alloc] init];
            [self.presentVC.navigationController pushViewController:controller animated:YES];
        }
        default:
            break;
    }
}

@end
