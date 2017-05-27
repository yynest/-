//
//  MedicalRecordUpdate.m
//  QianShanJY
//
//  Created by lxl on 15/11/11.
//  Copyright © 2015年 chinasun. All rights reserved.
//

#import "MedicalRecordUpdate.h"

@implementation MedicalRecordUpdate
{
    NSNumber *_userID;

    NSNumber *_height;
    NSNumber *_weight;
    NSNumber *_bsSikeage;
    NSNumber *_bsType;
    NSNumber *_sex;
}

- (void)clearPara
{
    _userID = nil;
    _height = nil;
    _weight = nil;
    _bsSikeage = nil;
    _bsType = nil;
    _sex = nil;

}


- (instancetype)initWithUserID:(NSNumber *)userId with:(patientType)type Para:(id)para
{
    self = [super init];
    [self clearPara];
    _userID = userId;
    
    if (self) {
        switch (type) {

            case patientTypeHeight:
                _height = para;
                break;
            case patientTypeWeight:
                _weight = para;
                break;
            case patientTypeDiagnosisYears:
                _bsSikeage = para;
                break;
            case patientTypeDiabetesType:
                _bsType = para;
                break;
            case patientTypeSex:
                _sex = para;
                break;
            default:
                break;
        }
  
    }
    return  self;
}

- (NSString *)requestURL
{
    return @"/user/info/update";
}

- (id)requestArgument {
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic sf_setObject:_userID forKey:@"id"];

    if (_height) {
        [dic sf_setObject:_height forKey:@"height"];
    }
    if (_weight) {
        [dic sf_setObject:_weight forKey:@"weight"];
    }
    if (_bsSikeage) {
        [dic sf_setObject:_weight forKey:@"bsSikeage"];
    }
    if (_bsType) {
        [dic sf_setObject:_weight forKey:@"bsType"];
    }
    if (_sex) {
        [dic sf_setObject:_weight forKey:@"sex"];
    }
 
    return dic;
}

@end
