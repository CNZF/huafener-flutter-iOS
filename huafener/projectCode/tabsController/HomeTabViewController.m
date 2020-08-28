//
//  HomeTabViewController.m
//  huafener
//
//  Created by 杨俊杰 on 2019/9/19.
//  Copyright © 2019 杨俊杰. All rights reserved.
//

#import "HomeTabViewController.h"
#import "HPHomeVCTableViewDelegate.h"



@interface HomeTabViewController ()<FlutterStreamHandler>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *viewDatas;

@property (nonatomic, strong) HPHomeVCTableViewDelegate *home_table_delegate;


@end

@implementation HomeTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewDatas = @[@"iOS跳转不同的Flutter界面",
                        @"iOS与Flutter互相传值",
                        @"FlutterListViewController",
                        @"",
                        @"",
                        @"",
                        @"",
                        @"",
                        @"",
                        @"",
                        @"",
                        @"",
                        @"",
                        @"",];
    [self.view addSubview:self.tableView];
}

- (HPHomeVCTableViewDelegate *)home_table_delegate{
    if (!_home_table_delegate) {
        _home_table_delegate = [HPHomeVCTableViewDelegate new];
        _home_table_delegate.datas = self.viewDatas;
        _home_table_delegate.presentVC = self;
    }
    return _home_table_delegate;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:(UITableViewStylePlain)];
        _tableView.delegate = self.home_table_delegate;
        _tableView.dataSource = self.home_table_delegate;
        
    }
    return _tableView;
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    FlutterViewController* flutterViewController = [[FlutterViewController alloc] initWithProject:nil nibName:nil bundle:nil];
//    [flutterViewController setInitialRoute:@"myApp"];
//    // 要与main.dart中一致
//    NSString *channelName = @"com.pages.your/native_post";
//
//    NSString *channelName_ = @"com.pages.your/native_get";
//
//    FlutterEventChannel *evenChannal = [FlutterEventChannel eventChannelWithName:channelName binaryMessenger:flutterViewController];
//    // 代理FlutterStreamHandler
//    [evenChannal setStreamHandler:self];
//
//    FlutterMethodChannel *messageChannel = [FlutterMethodChannel methodChannelWithName:channelName_ binaryMessenger:flutterViewController];
//
//    [messageChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
//        // call.method 获取 flutter 给回到的方法名，要匹配到 channelName 对应的多个 发送方法名，一般需要判断区分
//        // call.arguments 获取到 flutter 给到的参数，（比如跳转到另一个页面所需要参数）
//        // result 是给flutter的回调， 该回调只能使用一次
//        NSLog(@"method=%@ \narguments = %@", call.method, call.arguments);
//
//        // method和WKWebView里面JS交互很像
//        // flutter点击事件执行后在iOS跳转TargetViewController
//        if ([call.method isEqualToString:@"iOSFlutter"]) {
////            TargetViewController *vc = [[TargetViewController alloc] init];
////            [self.navigationController pushViewController:vc animated:YES];
//            NSLog(@"获取到事件点击");
//        }
//        // flutter传参给iOS
//        if ([call.method isEqualToString:@"iOSFlutter1"]) {
//            NSDictionary *dic = call.arguments;
//            NSLog(@"arguments = %@", dic);
//            NSString *code = dic[@"code"];
//            NSArray *data = dic[@"data"];
//            NSLog(@"code = %@", code);
//            NSLog(@"data = %@",data);
//            NSLog(@"data 第一个元素%@",data[0]);
//            NSLog(@"data 第一个元素类型%@",[data[0] class]);
//        }
//        // iOS给iOS返回值
//        if ([call.method isEqualToString:@"iOSFlutter2"]) {
//            if (result) {
//                result(@"返回给flutter的内容");
//            }
//        }
//    }];
//
//
//    [self.navigationController pushViewController:flutterViewController animated:YES];
//}
//
//#pragma mark - <FlutterStreamHandler>
//// // 这个onListen是Flutter端开始监听这个channel时的回调，第二个参数 EventSink是用来传数据的载体。
//- (FlutterError* _Nullable)onListenWithArguments:(id _Nullable)arguments
//                                       eventSink:(FlutterEventSink)events {
//    // arguments flutter给native的参数
//    // 回调给flutter， 建议使用实例指向，因为该block可以使用多次
//    if (events) {
//        events(@"push传值给flutter的vc");
//    }
//    return nil;
//}
//
///// flutter不再接收
//- (FlutterError* _Nullable)onCancelWithArguments:(id _Nullable)arguments {
//    // arguments flutter给native的参数
//    NSLog(@"%@", arguments);
//    return nil;
//}


@end
