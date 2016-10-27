//
//  ViewController.m
//  TouchMoveView
//
//  Created by mxl on 2016/10/27.
//  Copyright © 2016年 mxl. All rights reserved.
//

#import "ViewController.h"
#import "MoveView.h"
#import "global.h"
@interface ViewController ()
@property(nonatomic,weak) UIView *MoveView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(0, 0, self.view.frame.size.width
                             , 70);
    label.text = @"仅圆形区域以内可拖动";
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    MoveView *moveView = [[MoveView alloc] initWithFrame:CGRectMake(300, 300, 100, 100)];
    moveView.center = self.view .center;
    moveView.backgroundColor = [UIColor grayColor];
    moveView.layer.masksToBounds = YES;
    moveView.layer.cornerRadius = moveView.frame.size.height/2;
    _MoveView =moveView;
    [self.view addSubview:moveView];

    UIButton *btn = [[UIButton alloc] init];
    btn.bounds = CGRectMake(0, 0, 50, 50);
    btn.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height-30);
    [btn setImage:[UIImage imageNamed:imageiocn] forState:UIControlStateNormal];
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = btn.frame.size.height/2;
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)back{
    [UIView animateWithDuration:1.0 animations:^{
        self.MoveView.center = self.view .center;
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
