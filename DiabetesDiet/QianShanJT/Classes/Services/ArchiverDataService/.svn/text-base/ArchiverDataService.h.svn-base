//
//  ArchiverDataService.h
//  QianShanJT
//
//  Created by iosdev on 2017/5/10.
//  Copyright © 2017年 QSYJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArchiverDataService : NSObject

//把网络请求返回的数据源存在本地。指定沙盒文件路径[FileOperDocumentFilePath:fileName].不用判断文件是否存在，同名会覆盖。
+ (void)saveNetworkData:(id)modelData fileName:(NSString*)fileName;
//从沙盒中把缓存文件load出来。
+ (id)loadNetworkDataFileName:(NSString *)fileName;

+ (void)clearArchiverData;
@end
