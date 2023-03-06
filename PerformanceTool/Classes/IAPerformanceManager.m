//
//  IAPerformanceManager.m
//  FpsMemoryDemo
//
//  Created by Alter on 2018/7/23.
//  Copyright © 2018年 Netease. All rights reserved.
//

#import "IAPerformanceManager.h"
#import "IAPerformanceMemory.h"
#import "IAPerformanceCPU.h"
#import "IAPerformanceFPS.h"
#import "IAPerformanceWindow.h"

@interface IAPerformanceManager ()

@property (nonatomic, strong) IAPerformanceMemory *memoryMonitor;
@property (nonatomic, strong) IAPerformanceCPU *cpuMonitor;
@property (nonatomic, strong) IAPerformanceFPS *fpsMonitor;

@property (nonatomic, strong) IAPerformanceWindow *window;
@end

@implementation IAPerformanceManager

+ (instancetype)shared {
    static IAPerformanceManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[IAPerformanceManager alloc] init];
    });
    return instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _hideWhenStopMonitor = YES;
    }
    return self;
}

- (void)setupPerformanceOptional:(IAPerformanceOptional)optional {
    if (optional & IAPerformanceOptionalMemory) {
        self.memoryMonitor = [[IAPerformanceMemory alloc] init];
    }
    if (optional & IAPerformanceOptionalCPU) {
        self.cpuMonitor = [[IAPerformanceCPU alloc] init];
    }
    if (optional & IAPerformanceOptionalFPS) {
        self.fpsMonitor = [[IAPerformanceFPS alloc] init];
    }
}

- (void)startMonitor {
    [self.memoryMonitor startMonitor];
    [self.cpuMonitor startMonitor];
    [self.fpsMonitor startMonitor];
    
    [self showPerformance];
}

- (void)stopMonitor {
    [self.memoryMonitor stopMonitor];
    [self.cpuMonitor stopMonitor];
    [self.fpsMonitor stopMonitor];
    
    if (self.hideWhenStopMonitor) {
        self.window.hidden = YES;
    }
}

- (void)showPerformance {
    self.window = [[IAPerformanceWindow alloc] init];
    self.window.hidden = NO;
    
    __weak typeof(self) weakSelf = self;
    [self.memoryMonitor memoryCallback:^(float memory) {
        [weakSelf.window updateMemory:memory];
    }];
    [self.cpuMonitor cpuCallback:^(float cpu) {
        [weakSelf.window updateCPU:cpu];
    }];
    [self.fpsMonitor fpsCallback:^(float fps) {
        [weakSelf.window updateFPS:fps];
    }];
}

@end
