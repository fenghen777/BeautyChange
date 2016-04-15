//
//  Router.h
//  ZJBeautify
//
//  Created by hgh on 16/2/1.
//  Copyright © 2016年 Sinokor. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Router <NSObject>


/**
 *  更新跟控制器
 *
 *  @param _ctr
 */
-(void) modifyRootController:(id)_ctr;

@end

