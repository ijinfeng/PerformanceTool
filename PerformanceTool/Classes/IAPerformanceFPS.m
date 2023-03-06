//
//  IAPerformanceFPS.m
//  FpsMemoryDemo
//
//  Created by Alter on 2018/7/23.
//  Copyright © 2018年 Netease. All rights reserved.
//

#import "IAPerformanceFPS.h"
#import <QuartzCore/CADisplayLink.h>

@interface IAPerformanceFPS ()

@property (nonatomic, strong) CADisplayLink *displayLink;

@property (nonatomic, copy) void(^fpsCallback)(float);

@property (nonatomic, assign) NSTimeInterval lastTimestamp;

@property (nonatomic, assign) NSInteger frameCount;

@end

@implementation IAPerformanceFPS

- (void)startMonitor {
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(onDisplay:)];
    [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)stopMonitor {
    [self.displayLink invalidate];
    self.displayLink = nil;
}

- (void)fpsCallback:(void (^)(float))callback {
    self.fpsCallback = callback;
}

#pragma mark - 标示

- (void)onDisplay:(CADisplayLink *)link {
    if (self.lastTimestamp == 0) {
        self.lastTimestamp = link.timestamp;
        return;
    }
    
    self.frameCount++;
    NSTimeInterval delta = link.timestamp - self.lastTimestamp;
    if (delta < 1) return;
    self.lastTimestamp = link.timestamp;
    float fps = self.frameCount / delta;
    self.frameCount = 0;

    if (self.fpsCallback) {
        self.fpsCallback(fps);
    }
}

@end
