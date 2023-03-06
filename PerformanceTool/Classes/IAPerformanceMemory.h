//
//  IAPerformanceMemory.h
//  FpsMemoryDemo
//
//  Created by Alter on 2018/7/23.
//  Copyright © 2018年 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IAPerformanceMemory : NSObject

- (void)startMonitor;

- (void)stopMonitor;

- (void)memoryCallback:(void(^)(float memory))callback;

@end
