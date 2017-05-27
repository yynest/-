//
//  ShareListRecords.h
//
//  Created by iosdev  on 2017/5/24
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ShareListRecords : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double recordsIdentifier;
@property (nonatomic, assign) double friendUserId;
@property (nonatomic, strong) NSString *friendUserName;
@property (nonatomic, strong) NSString *friendUserPic;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
