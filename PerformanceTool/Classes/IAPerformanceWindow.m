//
//  IAPerformanceWindow.m
//  FpsMemoryDemo
//
//  Created by Alter on 2018/7/23.
//  Copyright © 2018年 Netease. All rights reserved.
//

#import "IAPerformanceWindow.h"
#import "IAPerformanceLabel.h"

static const float kLabelHeight = 25;

@interface IAPerformanceWindow ()

@property (nonatomic, strong) IAPerformanceLabel *memoryLabel;

@property (nonatomic, strong) IAPerformanceLabel *cpuLabel;

@property (nonatomic, strong) IAPerformanceLabel *fpsLabel;

@end

@implementation IAPerformanceWindow

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    self.windowLevel = UIWindowLevelAlert;
    self.userInteractionEnabled = NO;
    UIViewController *tempVC = [UIViewController new];
    tempVC.view.backgroundColor = [UIColor clearColor];
    self.rootViewController = tempVC;
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
    
    self.memoryLabel = [[IAPerformanceLabel alloc] init];
    self.cpuLabel = [[IAPerformanceLabel alloc] init];
    self.fpsLabel = [[IAPerformanceLabel alloc] init];
    
    self.memoryLabel.optional = IAPerformanceOptionalMemory;
    self.cpuLabel.optional = IAPerformanceOptionalCPU;
    self.fpsLabel.optional = IAPerformanceOptionalFPS;
    
    self.memoryLabel.suffix = @"M";
    self.cpuLabel.suffix = @"%";
    self.fpsLabel.suffix = @"fps";
    
    [self addSubview:self.memoryLabel];
    [self addSubview:self.cpuLabel];
    [self addSubview:self.fpsLabel];
}

- (void)layoutSubviews {
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat panelWidth = 120;
    CGFloat panelHeight = kLabelHeight * 3;
    self.frame = CGRectMake(screenWidth - panelWidth, 120, panelWidth, panelHeight);
    

    self.memoryLabel.frame = CGRectMake(10, 0, [self.memoryLabel getWidth], kLabelHeight);
    self.cpuLabel.frame = CGRectMake(10, kLabelHeight, [self.cpuLabel getWidth], kLabelHeight);
    self.fpsLabel.frame = CGRectMake(10, kLabelHeight * 2, [self.fpsLabel getWidth], kLabelHeight);
}

- (void)updateMemory:(float)memory {
    self.memoryLabel.hidden = NO;
    [self.memoryLabel updateValue:memory];
    
    self.memoryLabel.frame = CGRectMake(10, 0, [self.memoryLabel getWidth], kLabelHeight);
}

- (void)updateCPU:(float)cpu {
    self.cpuLabel.hidden = NO;
    [self.cpuLabel updateValue:cpu];
    
    self.cpuLabel.frame = CGRectMake(10, kLabelHeight, [self.cpuLabel getWidth], kLabelHeight);
}

- (void)updateFPS:(float)fps {
    self.fpsLabel.hidden = NO;
    [self.fpsLabel updateValue:fps];
    
    self.fpsLabel.frame = CGRectMake(10, kLabelHeight * 2, [self.fpsLabel getWidth], kLabelHeight);
}

@end
