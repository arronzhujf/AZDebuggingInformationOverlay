//
//  PresentedViewController.m
//  AZDebuggingInformationOverlay
//
//  Created by JianfengZhu on 2017/5/27.
//  Copyright © 2017年 JianfengZhu. All rights reserved.
//

#import "PresentedViewController.h"

@interface PresentedViewController ()

@end

@implementation PresentedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, 40)];
    btn.center = self.view.center;
    btn.backgroundColor = [UIColor whiteColor];
    [btn setTitle:@"dismiss" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(onTapBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
}

- (void)onTapBtn:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
