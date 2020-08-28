//
//  FlutterListViewController.m
//  huafener
//
//  Created by 杨俊杰 on 2020/3/24.
//  Copyright © 2020 杨俊杰. All rights reserved.
//

#import "FlutterListViewController.h"

@interface FlutterListViewController ()

@end

@implementation FlutterListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"跳转FLutter_listView";
}

- (void)addFlutterController{
    [[ZFFlutterEngine setBaseChannel] sendMessage:@"study_showListView"];
    FlutterViewController *fVC = [[FlutterViewController alloc] initWithEngine:[ZFFlutterEngine shareInstant] nibName:nil bundle:nil];
    fVC.view.backgroundColor =[UIColor whiteColor];
    [self.navigationController pushViewController:fVC animated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self addFlutterController];
}

@end
