//
//  ZFFlutterEngine.m
//  huafener
//
//  Created by 杨俊杰 on 2020/3/24.
//  Copyright © 2020 杨俊杰. All rights reserved.
//

#import "ZFFlutterEngine.h"
#import <GeneratedPluginRegistrant.h>


static ZFFlutterEngine *zfFlutterEngine = nil;
@implementation ZFFlutterEngine

+ (instancetype)shareInstant{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        zfFlutterEngine = [[ZFFlutterEngine alloc] initWithName:@"zf.com.flutterengine" project:nil];
        [zfFlutterEngine runWithEntrypoint:nil];
        [GeneratedPluginRegistrant registerWithRegistry:zfFlutterEngine];
        
    });
    return zfFlutterEngine;
}

+ (FlutterBasicMessageChannel *)setBaseChannel{
   return  [[FlutterBasicMessageChannel alloc] initWithName:@"viewLoad" binaryMessenger:zfFlutterEngine codec:FlutterStringCodec.sharedInstance];
}

@end
