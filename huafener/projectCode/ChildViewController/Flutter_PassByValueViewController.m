//
//  Flutter_PassByValueViewController.m
//  huafener
//
//  Created by 杨俊杰 on 2020/3/24.
//  Copyright © 2020 杨俊杰. All rights reserved.
//

#import "Flutter_PassByValueViewController.h"

@interface Flutter_PassByValueViewController ()<UITableViewDataSource,UITableViewDelegate,FlutterStreamHandler>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *datas;

@end

@implementation Flutter_PassByValueViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.datas = @[@"iOS主动与flutter交互",
                   @"flutter主动与iOS交互"];
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
            
            [[ZFFlutterEngine setBaseChannel] sendMessage:@"passbyValueToFlutter"];
            FlutterViewController *fVC = [[FlutterViewController alloc] initWithEngine:[ZFFlutterEngine shareInstant] nibName:nil bundle:nil];
            fVC.view.backgroundColor = [UIColor whiteColor];
            
            FlutterEventChannel *eventChannel = [FlutterEventChannel eventChannelWithName:@"passbyValueToFlutter_navi_post" binaryMessenger:fVC];
            [eventChannel setStreamHandler:self];
            [self.navigationController pushViewController:fVC animated:YES];
           }
               
               break;
       case 1:{
           WS(weakSelf)
           [[ZFFlutterEngine setBaseChannel] sendMessage:@"passByValueFromFlutter"];
           FlutterViewController *fVC = [[FlutterViewController alloc] initWithEngine:[ZFFlutterEngine shareInstant] nibName:nil bundle:nil];
           fVC.view.backgroundColor = [UIColor whiteColor];
           
           
           NSString *methonChannelStr = @"passbyValueFromFlutter_navi_post";
           FlutterMethodChannel *methonChannel = [FlutterMethodChannel methodChannelWithName:methonChannelStr binaryMessenger:fVC];
           // call.method 获取 flutter 给回到的方法名，要匹配到 channelName 对应的多个 发送方法名，一般需要判断区分
           // call.arguments 获取到 flutter 给到的参数，（比如跳转到另一个页面所需要参数）
           // result 是给flutter的回调， 该回调只能使用一次
           
           [methonChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
               NSLog(@"method=%@ \narguments = %@", call.method, call.arguments);
               if ([call.method isEqualToString:@"iOSFlutter"]) {
                   NSLog(@"点击了事件1");
               }
               // flutter传参给iOS
               if ([call.method isEqualToString:@"iOSFlutter1"]) {
                   NSDictionary *dic = call.arguments;
                   NSLog(@"arguments = %@", dic);
                   NSString *code = dic[@"code"];
                   NSArray *data = dic[@"data"];
                   NSLog(@"code = %@", code);
                   NSLog(@"data = %@",data);
                   NSLog(@"data 第一个元素%@",data[0]);
                   NSLog(@"data 第一个元素类型%@",[data[0] class]);
               }
               // iOS给iOS返回值
               if ([call.method isEqualToString:@"iOSFlutter2"]) {
                   if (result) {
                       result(@"返回给flutter的内容");
                   }
               }
               
           }];
           [self.navigationController pushViewController:fVC animated:YES];
       }
               
               break;
           default:
               break;
       }
}

#pragma mark -- <FlutterStreamHandler>  iOS 跟 Flutter交互 EventChannel
//flutter 不再接收参数
- (FlutterError * _Nullable)onCancelWithArguments:(id _Nullable)arguments {
    NSLog(@"arguments : %@",arguments);
    return nil;
}

//Flutter端开始监听这个channel时的回调，第二个参数 EventSink是用来传数据的载体
//arguments flutter给native的参数
- (FlutterError * _Nullable)onListenWithArguments:(id _Nullable)arguments eventSink:(nonnull FlutterEventSink)events {
    NSLog(@"arguments : %@",arguments);
    
    if (events) {
        events(@"传递给flutter的类型  id，本次为字符串");
    }
    return nil;
}


@end
