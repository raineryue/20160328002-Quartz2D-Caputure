//
//  ViewController.m
//  20160328002-Quartz2D-Caputure
//
//  Created by Rainer on 16/3/28.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Utils.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILongPressGestureRecognizer *longPressGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressGestureRecognizerAction:)];
    
    [self.view addGestureRecognizer:longPressGestureRecognizer];
}

/**
 *  长按手势事件处理
 */
- (void)longPressGestureRecognizerAction:(UILongPressGestureRecognizer *)longPressGestureRecognizer {
    NSLog(@"%s", __func__);
    
    
    
    if (longPressGestureRecognizer.state == UIGestureRecognizerStateEnded) {
        // 使用UIImage工具类截屏
        UIImage *image = [UIImage imageWithCaputureView:self.view];
        
        // 将图片数据转换为NSData二进制数据
        NSData *imageData = UIImagePNGRepresentation(image);
        
        // 将二进制数据一图片形式写到本地
        [imageData writeToFile:@"/Users/Rainer/Desktop/caputureImage.png" atomically:YES];
    }
}

- (void)caputureView {
    // 1.根据控制器视图创建一个位图上下文
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, 0.0);
    
    // 2.获取当前上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 3.将当前控制器视图的图层渲染到上下文上
    [self.view.layer renderInContext:context];
    
    // 4.从当前上下文中生成一张图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 5.关闭上下文
    UIGraphicsEndImageContext();

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
