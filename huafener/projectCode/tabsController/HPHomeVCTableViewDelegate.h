//
//  HPHomeVCTableViewDelegate.h
//  huafener
//
//  Created by 杨俊杰 on 2020/3/23.
//  Copyright © 2020 杨俊杰. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HPHomeVCTableViewDelegate : NSObject<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSArray *datas;

@property (nonatomic,weak) UIViewController *presentVC;

@end

NS_ASSUME_NONNULL_END
