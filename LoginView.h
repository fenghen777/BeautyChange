//
//  LoginView.h
//  BeautyChange
//
//  Created by SinoKor on 16/4/11.
//  Copyright © 2016年 chenyong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <TencentOpenAPI/TencentOAuth.h>
#import "WXApi.h"
#import "AppDelegate.h"
@interface LoginView : UIView<TencentSessionDelegate>


@property(nonatomic,strong)UITextField *nameField;
@property(nonatomic,strong)UITextField *passwordField;
@end
