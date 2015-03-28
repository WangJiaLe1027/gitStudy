//
//  ColorCircle.m
//   
//
//  Created by longzhou on 15/3/26.
//  Copyright (c) 2015年 cloudoer. All rights reserved.
//

#import "ColorCircle.h"

@interface ColorCircle ()

@property(nonatomic) CAShapeLayer *circleLayer;
@property(nonatomic) CAShapeLayer *bgcircleLayer;

- (void)addCircleLayer;

@end

@implementation ColorCircle


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSAssert(frame.size.width == frame.size.height, @"A circle must have the same height and width.");
        
    }
    return self;
}



#pragma mark - Instance Methods


- (void)complishedCircle {
    
    self.circleLayer.strokeEnd = 1.;
    
}


#pragma mark - Property Setters



- (void)setStrokeColor:(UIColor *)strokeColor
{
    self.circleLayer.strokeColor = strokeColor.CGColor;
    _strokeColor = strokeColor;
    
    [self addCircleLayer];
    
}


- (void)setRadius:(CGFloat)radius {
    _radius = radius;
    
    [self addCircleLayer];
}




#pragma mark - Private Instance methods

- (void)addCircleLayer
{
    if ([self.layer.sublayers containsObject:self.circleLayer]) {
        [self.circleLayer removeFromSuperlayer];
    }
    
    CGFloat lineWidth = self.radius ? self.radius : 4.;
    CGFloat radius = CGRectGetWidth(self.bounds)/2 - lineWidth/2;
    self.circleLayer = [CAShapeLayer layer];
    CGRect rect = CGRectMake(lineWidth/2, lineWidth/2, radius * 2, radius * 2);
    self.circleLayer.path = [UIBezierPath bezierPathWithRoundedRect:rect
                                                       cornerRadius:radius].CGPath;
    
    self.circleLayer.strokeColor = _strokeColor ? _strokeColor.CGColor : self.tintColor.CGColor;
    self.circleLayer.fillColor = nil;
    self.circleLayer.lineWidth = lineWidth;
    self.circleLayer.lineCap = kCALineCapRound;
    self.circleLayer.lineJoin = kCALineJoinMiter;
    
    self.circleLayer.strokeEnd = 1.f;
    
    
    
    [self.layer addSublayer:self.circleLayer];
}


@end
