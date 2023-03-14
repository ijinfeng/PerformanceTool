//
//  IAPerformanceMemory.m
//  FpsMemoryDemo
//
//  Created by Alter on 2018/7/23.
//  Copyright © 2018年 Netease. All rights reserved.
//

#import "IAPerformanceMemory.h"
#import <sys/sysctl.h>
#import <mach/mach.h>

@interface IAPerformanceMemory ()

@property (nonatomic, copy) void(^callback)(float);

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation IAPerformanceMemory

- (float)getUsedMemory {
    task_basic_info_data_t taskInfo;
    mach_msg_type_number_t infoCount = TASK_BASIC_INFO_COUNT;
    kern_return_t kernReturn = task_info(mach_task_self(),
                                         TASK_BASIC_INFO,
                                         (task_info_t)&taskInfo,
                                         &infoCount);
    if (kernReturn != KERN_SUCCESS) { return NSNotFound; }
    return taskInfo.resident_size / 1024.0 / 1024.0;
}

- (float)getUsageMemoryV2 {
    int64_t memoryUsageInByte = 0;
        task_vm_info_data_t vmInfo;
        mach_msg_type_number_t count = TASK_VM_INFO_COUNT;
        kern_return_t kernelReturn = task_info(mach_task_self(), TASK_VM_INFO, (task_info_t) &vmInfo, &count);
        if(kernelReturn == KERN_SUCCESS) {
            memoryUsageInByte = (int64_t) vmInfo.phys_footprint;
        } else {
            NSLog(@"Error with task_info(): %s", mach_error_string(kernelReturn));
        }
        return memoryUsageInByte / 1024.0 / 1024.0;
}

- (void)startMonitor {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)stopMonitor {
    [self.timer invalidate];
    self.timer = nil;
}

- (void)memoryCallback:(void (^)(float))callback {
    self.callback = callback;
}

#pragma mark - timer

- (void)onTimer {
    if (self.callback) {
        self.callback([self getUsageMemoryV2]);
    }
}

@end
