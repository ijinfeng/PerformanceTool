//
//  IAViewController.m
//  PerformanceTool
//
//  Created by ijinfeng on 03/06/2023.
//  Copyright (c) 2023 ijinfeng. All rights reserved.
//

#import "IAViewController.h"
@import PerformanceTool;

@interface IAViewController ()

@end

@implementation IAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[IAPerformanceManager shared] setupPerformanceOptional:IAPerformanceOptionalAll];
    [[IAPerformanceManager shared] startMonitor];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"button" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor greenColor]];
    [btn addTarget:self action:@selector(onClickButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    btn.frame = CGRectMake(self.view.bounds.size.width - 80, 120, 80, 40);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"点击屏幕");
}

- (void)onClickButton {
    NSLog(@"点击按钮");
}

@end
