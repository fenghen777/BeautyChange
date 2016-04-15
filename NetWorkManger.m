//
//  NetWorkManger.m
//  BeautyChange
//
//  Created by SinoKor on 16/4/14.
//  Copyright © 2016年 chenyong. All rights reserved.
//

#import "NetWorkManger.h"

@interface NetWorkManger ()

@end

@implementation NetWorkManger

+ (NetWorkManger *)sharedManager
{
    static NetWorkManger *sharedInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

@end
