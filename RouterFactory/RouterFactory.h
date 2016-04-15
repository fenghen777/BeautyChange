//
//  RouterFactory.h
//  ZJBeautify
//
//  Created by hgh on 16/2/1.
//  Copyright © 2016年 Sinokor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Router.h"

@interface RouterFactory : NSObject
{
    
}

/**
 *  获取单例对象
 *
 *  @return 返回单例对象
 */
+(RouterFactory*) shareDefault;

/**
 *  初始化视口
 *
 *  @param _wn
 */
-(void) initWindow:(UIWindow*)_wn;

/**
 *  返回
 *
 *  @return
 */
-(id<Router>) router;

@end
