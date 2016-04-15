//
//  RouterFactory.m
//  ZJBeautify
//
//  Created by hgh on 16/2/1.
//  Copyright © 2016年 Sinokor. All rights reserved.
//

#import "RouterFactory.h"
#import "ControllerRouter.h"

@interface RouterFactory()
{
    id<Router>           mRouter;
}

@end

@implementation RouterFactory


/**
 *  初始化视口
 *
 *  @param _wn
 */
-(void) initWindow:(UIWindow*)_wn
{
    ControllerRouter* _ct = [[ControllerRouter alloc] init];
    [_ct initWindow:_wn];
    mRouter = _ct;

}
/**
 *  返回
 *
 *  @return
 */
-(id<Router>) router
{
    return mRouter;
}


+ (id)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mHandle=[super allocWithZone:zone];
    });
    return mHandle;
    
    //return [[self createInstance] init];
}

static RouterFactory* mHandle=nil;
+(RouterFactory*) shareDefault
{
    @synchronized(self){
        if (mHandle==nil) {
            //mHandle=[[[[self class] alloc]init ]autorelease];
            mHandle = [[super allocWithZone:NULL]init];
            //[mHandle initWithDbName:@"contacts"];
            
        }
    }
    
    return mHandle;
}






@end
