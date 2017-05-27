//
//  UIViewController+AZOverlay.m
//  AZDebuggingInformationOverlay
//
//  Created by JianfengZhu on 2017/5/27.
//  Copyright © 2017年 JianfengZhu. All rights reserved.
//

#import "UIViewController+AZOverlay.h"
#import <objc/runtime.h>

@implementation UIViewController (AZOverlay)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class vc = [self class];
        
        SEL originalSelector = @selector(viewWillAppear:);
        SEL swizzledSelector = @selector(overlay_ViewwillAppear:);
        
        Method originalMethod = class_getInstanceMethod(vc, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(vc, swizzledSelector);
        method_exchangeImplementations(originalMethod, swizzledMethod);
    });
}

- (void)overlay_ViewwillAppear:(BOOL)animate {
    [self overlay_ViewwillAppear:animate];
    
    UIView *statusBar = (UIView *)[[UIApplication sharedApplication] valueForKeyPath:@"statusBarWindow.statusBar"];

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        statusBar.userInteractionEnabled = YES;
        UITapGestureRecognizer *doubleClick = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onDoubleClickStatusBar:)];
        doubleClick.numberOfTapsRequired = 2;
        [statusBar addGestureRecognizer:doubleClick];
    });
    
    
}

- (void)onDoubleClickStatusBar:(UIGestureRecognizer *)gesture {
    Class overlayClass = NSClassFromString(@"UIDebuggingInformationOverlay");
    [overlayClass performSelector:NSSelectorFromString(@"prepareDebuggingOverlay")];
    id overlay = [overlayClass performSelector:NSSelectorFromString(@"overlay")];
    [overlay performSelector:NSSelectorFromString(@"toggleVisibility")];
}



@end
