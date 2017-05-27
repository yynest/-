//
//  MedicalRecordUpdate.h
//  QianShanJY
//
//  Created by lxl on 15/11/11.
//  Copyright © 2015年 chinasun. All rights reserved.
//

#import "QSBaseRequest.h"

typedef enum {
    patientTypeSex,
    patientTypeHeight,
    patientTypeWeight,
    patientTypeAge,
    patientTypeDiabetesType,
    patientTypeDiagnosisYears,

}patientType;

@interface MedicalRecordUpdate : QSBaseRequest
- (instancetype)initWithUserID:(NSNumber *)userId with:(patientType)type Para:(id)para;
@end
