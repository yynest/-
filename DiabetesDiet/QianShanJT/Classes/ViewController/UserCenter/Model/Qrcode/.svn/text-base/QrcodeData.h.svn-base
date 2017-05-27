//
//  QrcodeData.h
//
//  Created by iosdev  on 2017/5/24
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface QrcodeData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *ticket;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, assign) double expireSeconds;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
