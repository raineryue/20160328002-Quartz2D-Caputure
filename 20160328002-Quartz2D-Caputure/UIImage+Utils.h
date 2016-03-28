//
//  UIImage+Utils.h
//  20160328001-Queartz2D-ClipImage
//
//  Created by Rainer on 16/3/28.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Utils)

/**
 *  裁剪一个圆形的图片
 *  imageName:图片名称
 *  border:圆环边宽
 *  color:圆环颜色
 */
+ (instancetype)imageWithName:(NSString *)imageName border:(CGFloat)border borderColor:(UIColor *)color;

/**
 *  截图操作
 *  view:需要截图的View视图
 */
+ (instancetype)imageWithCaputureView:(UIView *)view;

@end
