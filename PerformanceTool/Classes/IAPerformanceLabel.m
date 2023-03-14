//
//  IAPerformanceLabel.m
//  FpsMemoryDemo
//
//  Created by Alter on 2018/7/23.
//  Copyright © 2018年 Netease. All rights reserved.
//

#import "IAPerformanceLabel.h"

@implementation IAPerformanceLabel

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.textColor = [UIColor whiteColor];
        self.font = [UIFont systemFontOfSize:10];
        self.textAlignment= NSTextAlignmentCenter;
        self.hidden = YES;
    }
    return self;
}

- (void)updateValue:(float)value {
    NSString *string = [NSString stringWithFormat:@"%.1f%@",value,self.suffix];
    NSMutableAttributedString *att = [[NSMutableAttributedString alloc] initWithString:string];
    
    if (self.optional == IAPerformanceOptionalMemory) {
        if (value < 200) {
            [att addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:NSMakeRange(0, string.length - self.suffix.length)];
        } else if (value < 1024) {
            [att addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(0, string.length - self.suffix.length)];
        } else {
            [att addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, string.length - self.suffix.length)];
        }
        [att insertAttributedString:[[NSAttributedString alloc] initWithString:@"内存："] atIndex:0];
    } else if (self.optional == IAPerformanceOptionalCPU) {
        if (value < 20) {
            [att addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:NSMakeRange(0, string.length - self.suffix.length)];
        } else if (value < 60) {
            [att addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(0, string.length - self.suffix.length)];
        } else {
            [att addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, string.length - self.suffix.length)];
        }
        [att insertAttributedString:[[NSAttributedString alloc] initWithString:@"CPU："] atIndex:0];
    } else if (self.optional == IAPerformanceOptionalFPS) {
        if (value >= 60) {
            [att addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:NSMakeRange(0, string.length - self.suffix.length)];
        } else if (value <= 40) {
            [att addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(0, string.length - self.suffix.length)];
        } else {
            [att addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, string.length - self.suffix.length)];
        }
        [att insertAttributedString:[[NSAttributedString alloc] initWithString:@"FPS："] atIndex:0];
    }
    
    self.attributedText = [att copy];
}

- (CGFloat)getWidth {
    CGSize size = [self.text sizeWithAttributes:@{NSFontAttributeName : self.font}];
    return size.width + 10;
}

@end
