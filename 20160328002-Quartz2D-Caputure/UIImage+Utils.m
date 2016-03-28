//
//  UIImage+Utils.m
//  20160328001-Queartz2D-ClipImage
//
//  Created by Rainer on 16/3/28.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "UIImage+Utils.h"

@implementation UIImage (Utils)

/**
 *  裁剪一个圆形的图片
 *  imageName:图片名称
 *  border:圆环边宽
 *  color:圆环颜色
 */
+ (instancetype)imageWithName:(NSString *)imageName border:(CGFloat)border borderColor:(UIColor *)color {
    // 1.获取一个原始图片
    UIImage *oldImage = [UIImage imageNamed:imageName];
    
    // 2.根据原始图片和圆环边框宽度算出最合适的大圆尺寸
    // 获取最合适的裁剪宽高：这里应该获取图片的最短的一边
    CGFloat oldImageHW = oldImage.size.height > oldImage.size.width ? oldImage.size.width : oldImage.size.height;
    CGFloat bigCircleHW = oldImageHW + border * 2;
    
    // 3.根据大圆的尺寸开启一个图形上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(bigCircleHW, bigCircleHW), NO, 0.0);
    
    // 4.在上下文中画一个大圆作为头像背景
    UIBezierPath *bigCircleBeizerPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, bigCircleHW, bigCircleHW)];
    
    [color set];
    
    [bigCircleBeizerPath fill];
    
    // 5.根据原始图片大小设置图像裁剪路径
    UIBezierPath *newImageBezierPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(border, border, oldImageHW, oldImageHW)];
    
    // 6.将裁剪路径添加到裁剪区域中
    [newImageBezierPath addClip];
    
    // 7.开始绘制新的图片
    [oldImage drawAtPoint:CGPointMake(border, border)];
    
    // 8.从上下文中获取最新绘制的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 9.关闭图形上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}

/**
 *  截图操作
 *  view:需要截图的View视图
 */
+ (instancetype)imageWithCaputureView:(UIView *)view {
    // 1.根据视图尺寸创建一个位图上下文
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, 0.0);
    
    // 2.获取当前上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 3.将视图view的layer层渲染到当前上下文
    [view.layer renderInContext:context];
    
    // 4.从上下文中生成一张图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 5.关闭上下文
    UIGraphicsEndImageContext();
    
    // 返回生成好的图片
    return image;
}

@end
