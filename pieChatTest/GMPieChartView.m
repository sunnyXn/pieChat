//
//  GMPieChartView.m
//  pieChatTest
//
//  Created by sunny on 2017/8/18.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "GMPieChartView.h"

@implementation GMPieChartView


#pragma mark - draw circle
- (void)drawWithContext:(CGContextRef)context circleCenterX:(CGFloat)x circleCenterY:(CGFloat)y radius:(CGFloat)circleRadius start:(CGFloat)start end:(CGFloat)end innerWidth:(CGFloat)width color:(UIColor *)color {
    CGContextAddArc(context, x, y, circleRadius, start, end, 0);
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    CGContextSetLineWidth(context, width);
    CGContextStrokePath(context);
}

#pragma mark - draw line
- (void)drawLineWithContext:(CGContextRef)context width:(CGFloat)width startPointX:(CGFloat)x startPointY:(CGFloat)y endPointX:(CGFloat)endX endPointY:(CGFloat)endY color:(UIColor *)color {
    CGContextSetLineWidth(context, width);
    CGContextMoveToPoint(context, x, y);
    CGContextAddLineToPoint(context, endX, endY);
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    CGContextStrokePath(context);
}


- (void)drawRect:(CGRect)rect {
    // Drawing code
    // 0° = 最右点  ， 90° = 最下点 ， 180° = 最左点 ， 270° = 最上点 ， 360° = 最右点
//    M_PI = 180°  一度
    CGFloat angle = M_PI/180;
    /// 0°为最右点 所以重置为最上方点
    CGFloat startAngle = -90*angle;
    /// 正常360°为 最右点 所以 转换为 最上方点
    CGFloat endAngle = 270*angle;
    
    
    CGPoint pointCenter = CGPointMake(self.frame.size.width / 2.0, self.frame.size.height /2.0);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    
    for (int i = 0; i < self.arrPieces.count; i++)
    {
        UIColor * color = self.arrColors[i];
        
//        startAngle = -90 * angle;
//        endAngle  = 270* angle;
        
        // 当前比例
        CGFloat ratio = [self.arrPieces[i] floatValue];
        
        ratio = (ratio * 100) / 100;
        
        endAngle = startAngle + ratio * 360 * angle;
        
        NSLog(@"startAngle:%f  endAngle:%f",startAngle/angle , endAngle/angle);
        [self drawWithContext:context circleCenterX:pointCenter.x circleCenterY:pointCenter.y radius:(rect.size.width - self.pieWith)/2.0 start:startAngle end:endAngle innerWidth:self.pieWith color:color];
        
        startAngle = endAngle;
        
    }
    

    
    UILabel * lab = [[UILabel alloc] init];
    lab.frame = CGRectMake(0, 0, 40, 20);
    lab.text = @"这是啥";
    lab.backgroundColor = [UIColor whiteColor];
    lab.font  = [UIFont systemFontOfSize:13];
    lab.center = pointCenter;
    [self addSubview:lab];
}

- (CGFloat)pieWith
{
    if (!_pieWith)
    {
        _pieWith = 20;
    }
    return _pieWith;
}


@end
