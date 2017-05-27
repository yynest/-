//
//  HistoryTypeData.h
//
//  Created by iosdev  on 2017/5/19
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface HistoryTypeData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *lists;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
