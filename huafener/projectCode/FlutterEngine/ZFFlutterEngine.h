//
//  ZFFlutterEngine.h
//  huafener
//
//  Created by 杨俊杰 on 2020/3/24.
//  Copyright © 2020 杨俊杰. All rights reserved.
//

#import <Flutter/Flutter.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZFFlutterEngine : FlutterEngine

+ (instancetype)shareInstant;

+ (FlutterBasicMessageChannel *)setBaseChannel;

@end

NS_ASSUME_NONNULL_END
