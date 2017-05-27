//
//  ViewController.m
//  AZDebuggingInformationOverlay
//
//  Created by JianfengZhu on 2017/5/27.
//  Copyright © 2017年 JianfengZhu. All rights reserved.
//

#import "ViewController.h"
#import "PresentedViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    UIView *view1 = ({
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 50, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height-100)];
        view.backgroundColor = [UIColor greenColor];
        view;
    });
    UIView *view2 = ({
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 50, view1.bounds.size.width, view1.bounds.size.height-100)];
        view.backgroundColor = [UIColor redColor];
        view;
    });
    UIButton *btn = ({
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, 40)];
        button.backgroundColor = [UIColor whiteColor];
        [button setTitle:@"present" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        button.center = view2.center;
        [button addTarget:self action:@selector(onTapBtn:) forControlEvents:UIControlEventTouchUpInside];
        button;
    });
    
    [self.view addSubview:view1];
    [view1 addSubview:view2];
    [view2 addSubview:btn];
}

- (void)onTapBtn:(UIButton *)sender {
    PresentedViewController *vc2 = [PresentedViewController new];
    [self presentViewController:vc2 animated:YES completion:nil];
}


@end
