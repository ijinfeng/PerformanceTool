//
//  IAPerformanceLabel.h
//  FpsMemoryDemo
//
//  Created by Alter on 2018/7/23.
//  Copyright © 2018年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IAPerformanceManager.h"

@interface IAPerformanceLabel : UILabel

@property (nonatomic, copy) NSString *suffix;

@property (nonatomic, assign) IAPerformanceOptional optional;

- (void)updateValue:(float)value;

- (CGFloat)getWidth;

@end
