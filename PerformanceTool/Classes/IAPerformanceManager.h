//
//  IAPerformanceManager.h
//  FpsMemoryDemo
//
//  Created by Alter on 2018/7/23.
//  Copyright © 2018年 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_OPTIONS(NSInteger, IAPerformanceOptional) {
    IAPerformanceOptionalMemory = 1 << 1,
    IAPerformanceOptionalCPU    = 1 << 2,
    IAPerformanceOptionalFPS    = 1 << 3,
    
    IAPerformanceOptionalAll = IAPerformanceOptionalMemory|IAPerformanceOptionalCPU|IAPerformanceOptionalFPS
};

@interface IAPerformanceManager : NSObject

+ (instancetype)shared;

@property (nonatomic, assign) BOOL hideWhenStopMonitor; 

- (void)setupPerformanceOptional:(IAPerformanceOptional)optional;

- (void)startMonitor;

- (void)stopMonitor;

@end
