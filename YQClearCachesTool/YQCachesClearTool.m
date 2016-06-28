//
//  YQCachesClearTool.m
//  YQClearCachesTool
//
//  Created by Cuiyongqin on 16/6/28.
//  Copyright © 2016年 Cuiyongqin. All rights reserved.
//

#import "YQCachesClearTool.h"

@implementation YQCachesClearTool
+ (NSString *)getCacheSizeWithFilePath:(NSString *)path {
    NSArray *subPathArr = [[NSFileManager defaultManager] subpathsAtPath:path];
    
    NSString *filePath = nil;
    NSInteger totalSize = 0;
    
    for (NSString *subPath in subPathArr) {
        filePath = [path stringByAppendingPathComponent:subPath];
        
        BOOL isDirectory = NO;
        BOOL isExist = [[NSFileManager defaultManager] fileExistsAtPath:filePath isDirectory:&isDirectory];
        
        if (!isExist || isDirectory || [filePath containsString:@".DS"]) {
            continue;
        }
        
        NSDictionary *pathDict = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:nil];
        NSInteger size = [pathDict[@"NSFileSize" ] integerValue];
        
        totalSize += size;
        
    }
    
    NSString *totalStr = nil;
    if (totalSize > 1000 * 1000) {
        totalStr = [NSString stringWithFormat:@"%.2fM",totalSize /1000.00f/1000.00f];
    }else if (totalSize > 1000) {
        totalStr = [NSString stringWithFormat:@"%.2fKB",totalSize /1000.00f];
    }else{
        totalStr = [NSString stringWithFormat:@"%.2fB",totalSize /1.00f];
    }
    
    return totalStr;
}

+ (void)clearCacheWithFilePath:(NSString *)path completion:(void (^)())completion{
    
    NSArray *subPathArr = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:nil];
    NSString *filePath = nil;
    NSError *error = nil;
    for (NSString *subPath in subPathArr) {
        filePath = [path stringByAppendingPathComponent:subPath];
       BOOL isSuccess = [[NSFileManager defaultManager] removeItemAtPath:filePath error:&error];
        if (isSuccess) {
            completion();
        }
    }
}

@end

































