//
//  NSArray+Safe.m
//  array
//
//  Created by lxl on 17/3/2.
//  Copyright © 2017年 lxl. All rights reserved.
//

#import "NSArray+Safe.h"

@implementation NSArray (Safe)


- (id)sf_objectAtIndex:(NSUInteger)index{
    //元素个数为0
    if (self.count == 0) {
        return nil;
    }
    //访问越界
    if (self.count <= index) {
        return nil;
    }
    //返回值
    return [self objectAtIndex:index];
}

@end
