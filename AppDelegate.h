//
//  AppDelegate.h
//  BeautyChange
//
//  Created by SinoKor on 16/4/7.
//  Copyright © 2016年 chenyong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import <TencentOpenAPI/TencentApiInterface.h>
#import <TencentOpenAPI/TencentOAuth.h>
#import "WXApi.h"
#import "AFNetworking.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate,WXApiDelegate>

@property (strong, nonatomic) UIWindow *window;

- (void)showTabBar;
@end

