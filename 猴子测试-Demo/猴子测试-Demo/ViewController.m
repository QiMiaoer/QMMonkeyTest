//
//  ViewController.m
//  猴子测试-Demo
//
//  Created by zyx on 17/4/1.
//  Copyright © 2017年 其妙. All rights reserved.
//

#import "ViewController.h"

#define dot_WH 20

@interface ViewController ()

@end

@implementation ViewController {
    UILabel *_label;
    UIView *_dotView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UILabel *lab = [UILabel new];
    lab.font = [UIFont boldSystemFontOfSize:30];
    [self.view addSubview:lab];
    _label = lab;
    
    UILabel *l = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, self.view.bounds.size.width, 30)];
    l.font = lab.font;
    l.text = @"点击位置";
    l.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:l];
    
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(-dot_WH, -dot_WH, dot_WH, dot_WH)];
    v.backgroundColor = [UIColor redColor];
    v.layer.cornerRadius = dot_WH / 2;
    v.clipsToBounds = YES;
    [self.view addSubview:v];
    _dotView = v;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint point = [touch locationInView:self.view];
    
    _dotView.center = point;
    
    _label.text = NSStringFromCGPoint(point);
    [_label sizeToFit];
    _label.center = self.view.center;
    
//    self.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
