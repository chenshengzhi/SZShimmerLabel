//
//  SZShimmerLabel.m
//  SZShimmerLabel
//
//  Created by 陈圣治 on 15/12/2.
//  Copyright © 2015年 shengzhichen. All rights reserved.
//

#import "SZShimmerLabel.h"

@interface SZShimmerLabel ()

@property (nonatomic, strong) CAGradientLayer *maskGradientLayer;

@property (nonatomic, strong) UILabel *maskLabel;

@end

@implementation SZShimmerLabel

- (void)startShimmer {
    _maskLabel = [[UILabel alloc] initWithFrame:self.frame];
    _maskLabel.text = self.text;
    _maskLabel.font = self.font;
    _maskLabel.textColor = _shimmerTextColor;
    _maskLabel.shadowColor = self.shadowColor;
    _maskLabel.shadowOffset = self.shadowOffset;
    _maskLabel.textAlignment = self.textAlignment;
    _maskLabel.lineBreakMode = self.lineBreakMode;
    _maskLabel.numberOfLines = self.numberOfLines;
    _maskLabel.adjustsFontSizeToFitWidth = self.adjustsFontSizeToFitWidth;
    _maskLabel.baselineAdjustment = self.baselineAdjustment;
    _maskLabel.minimumScaleFactor = self.minimumScaleFactor;
    _maskLabel.preferredMaxLayoutWidth = self.preferredMaxLayoutWidth;
    [self.superview addSubview:_maskLabel];
    
    _maskGradientLayer = [CAGradientLayer layer];
    _maskGradientLayer.anchorPoint = CGPointZero;
    _maskGradientLayer.bounds = _maskLabel.bounds;
    UIColor *maskColor = [UIColor whiteColor];
    UIColor *unMaskColor = [UIColor clearColor];
    _maskGradientLayer.colors = @[(id)unMaskColor.CGColor, (id)maskColor.CGColor, (id)unMaskColor.CGColor];
    _maskGradientLayer.locations = @[@0, @0.5, @1];
    _maskGradientLayer.startPoint = CGPointMake(0, 0.5);
    _maskGradientLayer.endPoint = CGPointMake(1, 0.5);
    
    CALayer *maskLayer = [CALayer layer];
    maskLayer.anchorPoint = CGPointZero;
    maskLayer.bounds = _maskLabel.bounds;
    [maskLayer addSublayer:_maskGradientLayer];
    
    _maskLabel.layer.mask = maskLayer;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(-_maskLabel.frame.size.width, 0)];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(_maskLabel.frame.size.width, 0)];
    animation.repeatCount = HUGE_VALF;
    animation.duration = _duration;
    animation.removedOnCompletion = NO;
    [_maskGradientLayer addAnimation:animation forKey:nil];
}

- (void)stopShimmer {
    if (_maskGradientLayer) {
        [_maskGradientLayer removeAllAnimations];
    }
    [_maskLabel removeFromSuperview];
    _maskLabel = nil;
}

@end
