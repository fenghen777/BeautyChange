//
//  ControllerRouter.m
//  ZJBeautify
//
//  Created by hgh on 16/2/1.
//  Copyright © 2016年 Sinokor. All rights reserved.
//

#import "ControllerRouter.h"

@interface ControllerRouter()
{
    UIWindow*                       mWindows;
    UIViewController*               mCurrentCtr;
}

@end

@implementation ControllerRouter


/**
 *  初始化视口
 *
 *  @param _wn
 */
-(void) initWindow:(UIWindow*)_wn
{
    mWindows = _wn;
}

/**
 *  更新跟控制器
 *
 *  @param _ctr
 */
-(void) modifyRootController:(UIViewController*)_ctr
{
    if (mCurrentCtr!=nil) {
        if ([mCurrentCtr isEqual:_ctr]) {
            return;
        }
        
    }
    
    mWindows.rootViewController = _ctr;
    mCurrentCtr = nil;
    mCurrentCtr = _ctr;
    
}


@end
