//
//  ArchiverDataService.m
//  QianShanJT
//
//  Created by iosdev on 2017/5/10.
//  Copyright © 2017年 QSYJ. All rights reserved.
//

#import "ArchiverDataService.h"

@implementation ArchiverDataService

//把网络请求返回的数据源存在本地。指定沙盒文件路径[FileOperDocumentFilePath:fileName].不用判断文件是否存在，同名会覆盖。

+ (void)saveNetworkData:(id)modelData fileName:(NSString*)fileName {
    if(!modelData || !fileName) {
        return;
    }
    NSMutableData*data = [[NSMutableData alloc] init];
    NSKeyedArchiver*archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:modelData forKey:fileName];
    [archiver finishEncoding];
    [data writeToFile: [self getPathWithFileName:fileName] atomically:YES];
}

//从沙盒中把缓存文件load出来。
+ (id)loadNetworkDataFileName:(NSString *)fileName {
    if(!fileName) {
        return nil;
    }
    id modelData = nil;
    NSData*data = [[NSMutableData alloc] initWithContentsOfFile: [self getPathWithFileName:fileName]];
    if(data) {
        NSKeyedUnarchiver*unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
        modelData = [unarchiver decodeObjectForKey:fileName];
    }
    return modelData;
}

+ (NSString *)getPathWithFileName:(NSString *)fileName {
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filePath = [docPath stringByAppendingPathComponent:fileName];
    return filePath;
}

+ (void)clearArchiverData {
    NSString *DocumentsPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSDirectoryEnumerator *enumerator = [[NSFileManager defaultManager] enumeratorAtPath:DocumentsPath];
    for (NSString *fileName in enumerator) {
        [[NSFileManager defaultManager] removeItemAtPath:[DocumentsPath stringByAppendingPathComponent:fileName] error:nil];
    }
}

@end
