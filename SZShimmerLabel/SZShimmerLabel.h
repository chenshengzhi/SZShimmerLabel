//
//  SZShimmerLabel.h
//  SZShimmerLabel
//
//  Created by 陈圣治 on 15/12/2.
//  Copyright © 2015年 shengzhichen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SZShimmerLabel : UILabel

@property (nonatomic, strong) UIColor *shimmerTextColor;

@property (nonatomic) CFTimeInterval duration;

- (void)startShimmer;

- (void)stopShimmer;

@end
