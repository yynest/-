//
//  ShareListModel.h
//
//  Created by iosdev  on 2017/5/24
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ShareListData;

@interface ShareListModel : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double errCode;
@property (nonatomic, strong) NSString *errMsg;
@property (nonatomic, strong) ShareListData *data;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
