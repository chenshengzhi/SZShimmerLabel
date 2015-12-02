//
//  ViewController.m
//  SZShimmerLabel
//
//  Created by 陈圣治 on 15/12/2.
//  Copyright © 2015年 shengzhichen. All rights reserved.
//

#import "ViewController.h"
#import "SZShimmerLabel.h"

@interface ViewController ()

@property (nonatomic, strong) SZShimmerLabel *shimmerLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    _shimmerLabel = [[SZShimmerLabel alloc] initWithFrame:CGRectMake(10, 80, 0, 0)];
    _shimmerLabel.text = @"Hello World!";
    _shimmerLabel.textColor = [UIColor blackColor];
    _shimmerLabel.font = [UIFont systemFontOfSize:30];
    [_shimmerLabel sizeToFit];
    _shimmerLabel.shimmerTextColor = [UIColor whiteColor];
    _shimmerLabel.duration = 2;
    _shimmerLabel.shadowColor = _shimmerLabel.textColor;
    _shimmerLabel.shadowOffset = CGSizeMake(0, 1);
    
    [self.view addSubview:_shimmerLabel];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [_shimmerLabel startShimmer];
}

@end
