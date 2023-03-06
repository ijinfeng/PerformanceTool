//
//  IAPerformanceFPS.h
//  FpsMemoryDemo
//
//  Created by Alter on 2018/7/23.
//  Copyright © 2018年 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IAPerformanceFPS : NSObject

- (void)startMonitor;

- (void)stopMonitor;

- (void)fpsCallback:(void(^)(float fps))callback;

@end
