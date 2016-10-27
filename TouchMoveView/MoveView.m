//
//  MoveView.m
//  TouchMoveView
//
//  Created by mxl on 2016/10/27.
//  Copyright © 2016年 mxl. All rights reserved.
//
#import "MoveView.h"
#import "global.h"

@implementation MoveView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageiocn]];
        CGFloat Fw = frame.size.width;
        CGFloat Fh = frame.size.height;
        image.frame = CGRectMake(0, 0, Fw, Fh);
        [self addSubview:image];
    }
    return self;
}
//- (BOOL)touchPointInsideCircle:(CGPoint)center radius:(CGFloat)radius targetPoint:(CGPoint)point
//	{
//    CGFloat dist = sqrtf((point.x - center.x) * (point.x - center.x) +
// (point.y - center.y) * (point.y - center.y));
//    return  (dist <= radius);
//}
////
//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
// {
//     UIView *hitView = nil;
//     BOOL pointInRound = [self touchPointInsideCircle:self.center radius:self.frame.size.height/2 targetPoint:point];
////             if (pointInRound) {
////                  hitView = roundBtn;
////               }  else  if(CGRectContainsPoint(leftBtn.frame, point)) {
////                  hitView  = leftBtn;
////            } else if(CGRectContainsPoint(rightBtn.frame, point)) {
////                    hitView = rightBtn;
////           }else{
////           hitView =   self;
////          }
//     if (pointInRound) {
//         return self;
//     }
//     return self;
//}
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
//首先调用父类的方法确定点击的区域确实在按钮的区域中
     BOOL res = [super pointInside:point  withEvent:event];
     if (res) {
     //绘制一个圆形path
     UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:self.bounds];
     if ([path containsPoint:point]) {
     //如果在path区域内，返回YES
     return YES;
   }
      return NO;
  }
 return NO;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
      UITouch *touch = [touches anyObject];
      // 获取当前的位置
      CGPoint curP = [touch locationInView:self];
      // 获取之前的位置
      CGPoint preP = [touch previousLocationInView:self];
     // 获取在X轴的偏移量
      CGFloat offSetX = curP.x - preP.x;
      // 获取在Y轴的偏移量
     CGFloat offSetY = curP.y - preP.y;
     CGPoint center = self.center;
     center.x += offSetX;
     center.y += offSetY;
     self.center = center;
}



@end
