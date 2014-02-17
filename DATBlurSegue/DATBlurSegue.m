//
//  ModalBlurSegue.m
//  BoyfriendLog
//
//  Created by Peter Gulyas on 2/11/2014.
//  Copyright (c) 2014 DATInc. All rights reserved.
//

#import "DATBlurSegue.h"
#import "DATBlurView.h"

@implementation DATBlurSegue

-(void) perform{
    
    UIViewController* sourceViewController = self.sourceViewController;
    UIViewController* destinationViewController = self.destinationViewController;
    
    while (sourceViewController.parentViewController) {
        sourceViewController = sourceViewController.parentViewController;
    }
    
    sourceViewController.modalPresentationStyle = UIModalPresentationCurrentContext;
    
    DATBlurView* blur = [[DATBlurView alloc] initWithFrame:destinationViewController.view.bounds];
    blur.tintColor = destinationViewController.view.backgroundColor;

    blur.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    destinationViewController.view.backgroundColor = [UIColor clearColor];
    [destinationViewController.view insertSubview:blur atIndex:0];
   
    destinationViewController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
    [sourceViewController presentViewController:destinationViewController animated:NO completion:nil];
    
    // We need to do a custom animation because presentViewController does not support UIModalPresentationCurrentContext
    CGRect endRect = destinationViewController.view.frame;
    CGRect startRect = endRect;
    
    switch ([[UIApplication sharedApplication] statusBarOrientation]) {
        case UIInterfaceOrientationPortrait:
            startRect.origin.y = CGRectGetMaxY(endRect);
            break;
        case UIInterfaceOrientationPortraitUpsideDown:
            startRect.origin.y = -CGRectGetMaxY(endRect);
            break;
        case UIInterfaceOrientationLandscapeLeft:
            startRect.origin.x = CGRectGetMaxX(endRect);
            break;
        case UIInterfaceOrientationLandscapeRight:
            startRect.origin.x = -CGRectGetMaxX(endRect);
            break;
        default:
            break;
    }
    
    destinationViewController.view.frame = startRect;
    
    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        destinationViewController.view.frame = endRect;
    } completion:nil];
}

@end
