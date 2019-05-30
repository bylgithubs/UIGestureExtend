//
//  ViewController.m
//  UIGestureExtend
//
//  Created by Civet on 2019/5/22.
//  Copyright © 2019年 PandaTest. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImageView *iView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"2.jpg"]];
    iView.frame = CGRectMake(50, 50, 200, 300);
    iView.userInteractionEnabled = YES;
    [self.view addSubview:iView];
    //创建一个平移手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAct:)];
    //将手势添加到图像视图中、
    [iView addGestureRecognizer:pan];
    //将移动事件手势从图像视图中取消
    [iView removeGestureRecognizer:pan];
    //创建一个滑动手势
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeAct:)];
    //设定滑动手势接受事件类型
    //UISwipeGesturerecognizerDirectionLeft:向左滑动
    //UISwipeGesturerecognizerDirectionRight:向右滑动
    //UISwipeGesturerecognizerDirectionUp:向上滑动
    //UISwipeGesturerecognizerDirDDectionDown:向下滑动
    swipe.direction = UISwipeGestureRecognizerDirectionLeft;
    [iView addGestureRecognizer:swipe];
    
    UISwipeGestureRecognizer *swipe1 = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeAct:)];
    //设定滑动手势接受事件类型
    swipe1.direction = UISwipeGestureRecognizerDirectionRight;
    [iView addGestureRecognizer:swipe1];
    
    //创建长按手势
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(pressLong:)];
    [iView addGestureRecognizer:longPress];
    //设置长按手势时间
    longPress.minimumPressDuration = 0.5;
}

//长按手势响应事件
- (void)pressLong:(UILongPressGestureRecognizer *)press{
    //手势状态
    if (press.state == UIGestureRecognizerStateBegan){
        NSLog(@"开始状态");
        //手指离开屏幕调用
    }else if(press.state == UIGestureRecognizerStateEnded) {
         NSLog(@"结束状态");
    }
    

}

//向左滑动
- (void)swipeAct:(UISwipeGestureRecognizer *)swipe{
    NSLog(@"aaaaa========%lu,%lu",(unsigned long)swipe.direction,(unsigned long)UISwipeGestureRecognizerDirectionRight);
    if (swipe.direction == UISwipeGestureRecognizerDirectionLeft){
        NSLog(@"向左滑动");
    }else if (swipe.direction == UISwipeGestureRecognizerDirectionRight){
        NSLog(@"向右滑动");
    }
    
}

//移动事件函数，只要手指坐标在屏幕上发生变化时，函数就被调用
- (void)panAct:(UIPanGestureRecognizer *)pan{
    //获取移动的坐标，现对于视图的坐标系
    //参数：相对的视图对象
    CGPoint pt = [pan translationInView:self.view];
    NSLog(@"pt.x = %.2f, pt.y = %.2f",pt.x,pt.y);
    //获取移动时的相对速度
    CGPoint pV = [pan velocityInView:self.view];
    NSLog(@"pV.x = %.2f, pV.y = %.2f",pV.x,pV.y);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
