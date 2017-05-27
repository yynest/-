//
//  NSMutableDictionary+Safe.m
//  array
//
//  Created by lxl on 17/3/2.
//  Copyright © 2017年 lxl. All rights reserved.
//

#import "NSMutableDictionary+Safe.h"

@implementation NSMutableDictionary (Safe)


- (void)sf_setObject:(id)anObject forKey:(id)aKey{
    
    //插入为nil 则返回
    if (!aKey || !anObject) {
        return;
    }
    
    [self setObject:anObject forKey:aKey];
}
@end
