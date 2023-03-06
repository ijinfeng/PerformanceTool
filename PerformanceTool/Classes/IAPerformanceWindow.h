//
//  IAPerformanceWindow.h
//  FpsMemoryDemo
//
//  Created by Alter on 2018/7/23.
//  Copyright © 2018年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IAPerformanceWindow : UIWindow

- (void)updateMemory:(float)memory;

- (void)updateCPU:(float)cpu;

- (void)updateFPS:(float)fps;

@end
