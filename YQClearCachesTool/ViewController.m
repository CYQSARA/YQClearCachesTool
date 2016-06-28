//
//  ViewController.m
//  YQClearCachesTool
//
//  Created by Cuiyongqin on 16/6/28.
//  Copyright © 2016年 Cuiyongqin. All rights reserved.
//

#import "ViewController.h"
#import "YQCachesClearTool.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSString *path = NSTemporaryDirectory();
//   NSString *size = [YQCachesClearTool getCacheSizeWithFilePath:path];
   [YQCachesClearTool clearCacheWithFilePath:path completion:^{
       
       NSString *size = [YQCachesClearTool getCacheSizeWithFilePath:path];
       NSLog(@"清除成功:size = %@",size);
       
   }];
    
}

@end































