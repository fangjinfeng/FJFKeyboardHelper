//
//  LYTabBarController.h
//  LeyinIntelligence
//
//  Created by xianjb on 2017/9/1.
//  Copyright © 2017年 Leyin. All rights reserved.
//

#import "UIViewController+KeyboardCurrentViewController.h"

@implementation UIViewController (FJFKeyboardCurrentViewController)

+ (UIViewController *)moa_keyboardCurrentViewController {
    // Find best view controller
    UIViewController* viewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    return [UIViewController moa_findBestViewController:viewController];
}

+ (UIViewController*)moa_findBestViewController:(UIViewController*)vc {
    
    if (vc.presentedViewController) {
        
        // Return presented view controller
        return [UIViewController moa_findBestViewController:vc.presentedViewController];
    } else if ([vc isKindOfClass:[UISplitViewController class]]) {
        
        // Return right hand side
        UISplitViewController* svc = (UISplitViewController*) vc;
        if (svc.viewControllers.count > 0)
            return [UIViewController moa_findBestViewController:svc.viewControllers.lastObject];
        else
            return vc;
    } else if ([vc isKindOfClass:[UINavigationController class]]) {
        
        // Return top view
        UINavigationController* svc = (UINavigationController*) vc;
        if (svc.viewControllers.count > 0)
            return [UIViewController moa_findBestViewController:svc.topViewController];
        else
            return vc;
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        
        // Return visible view
        UITabBarController* svc = (UITabBarController*) vc;
        if (svc.viewControllers.count > 0)
            return [UIViewController moa_findBestViewController:svc.selectedViewController];
        else
            return vc;
    } else {
        
        // Unknown view controller type, return last child view controller
        return vc;
    }
}

@end
