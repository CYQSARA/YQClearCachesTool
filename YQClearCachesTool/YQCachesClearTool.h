//
//  YQCachesClearTool.h
//  YQClearCachesTool
//
//  Created by Cuiyongqin on 16/6/28.
//  Copyright © 2016年 Cuiyongqin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YQCachesClearTool : NSObject
+ (NSString *)getCacheSizeWithFilePath:(NSString *)path;
+ (void)clearCacheWithFilePath:(NSString *)path completion:(void(^)())completion;
@end
