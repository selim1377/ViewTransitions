//
//  SettingTransition.m
//  ViewControllerTransition
//
//  Created by Selım on 08/12/15.
//  Copyright © 2015 PeakGames. All rights reserved.
//

#import "SettingTransition.h"

@implementation SettingTransition

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 1.0;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromVC    = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC      = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
 
    UIView *fromView = fromVC.view;
    UIView *toView = toVC.view;
    
    UIView *container = [transitionContext containerView];
    
    if(!self.reverse)
    {
        CGRect initialToFrame = container.bounds;
        initialToFrame.origin.x = -container.bounds.size.width;
        CGRect lastToFrame = container.bounds;
        
        toView.frame = initialToFrame;
        [container addSubview:toView];
        
        
        UIView *snapshotFrom = [fromView snapshotViewAfterScreenUpdates:YES];
        snapshotFrom.frame   = fromView.frame;
        [container addSubview:snapshotFrom];
        
        CGRect lastFromFrame = container.bounds;
        lastFromFrame.origin.x = lastFromFrame.size.width - 100;
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext]
                              delay:0.1
             usingSpringWithDamping:1.0
              initialSpringVelocity:10.0
                            options:UIViewAnimationOptionCurveEaseOut
                         animations:^{
                             
                             toView.frame       = lastToFrame;
                             fromView.frame     = lastFromFrame;
                             snapshotFrom.frame = lastFromFrame;
                         }
                         completion:^(BOOL finished) {
                             
                             [snapshotFrom removeFromSuperview];
                             [transitionContext completeTransition:finished];
                             [[container superview] bringSubviewToFront:fromView];
                         }];
        
//        [UIView animateWithDuration:[self transitionDuration:transitionContext]
//                         animations:^{
//                             
//                             toView.frame       = lastToFrame;
//                             fromView.frame     = lastFromFrame;
//                             snapshotFrom.frame = lastFromFrame;
//                         }
//                         completion:^(BOOL finished) {
//                             
//                             [snapshotFrom removeFromSuperview];
//                             [transitionContext completeTransition:finished];
//                             [[container superview] bringSubviewToFront:fromView];
//                         }];
    }
    else
    {
        CGRect lastFromFrame = container.bounds;
        lastFromFrame.origin.x = -container.bounds.size.width;
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext]
                              delay:0.1
             usingSpringWithDamping:1.0
              initialSpringVelocity:10.0
                            options:UIViewAnimationOptionCurveEaseOut
                         animations:^{
                             
                             toView.frame       = container.bounds;
                             fromView.frame     = lastFromFrame;
                         }
                         completion:^(BOOL finished) {
                             [transitionContext completeTransition:finished];
                
                         }];
    }
    
}



@end
