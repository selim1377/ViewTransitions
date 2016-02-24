//
//  ScaleDownTransition.m
//  ViewControllerTransition
//
//  Created by Selım on 23/02/16.
//  Copyright © 2016 PeakGames. All rights reserved.
//

#import "ScaleDownTransition.h"


@implementation ScaleDownTransition 

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 1.1;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *source = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *target = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    
    UIView *sourceSnap = [source.view snapshotViewAfterScreenUpdates:NO];
    sourceSnap.frame   = source.view.frame;
    [containerView addSubview:sourceSnap];
    
    [containerView insertSubview:target.view belowSubview:source.view];
    
    [source.view removeFromSuperview];
    
    // Initial animation configuration
    target.view.alpha = 0.1f;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         target.view.alpha = 1.0f;
                         sourceSnap.frame = CGRectInset(source.view.frame, source.view.frame.size.width/2, source.view.frame.size.height/2);
                     }
                     completion:^(BOOL finished) {
                         
                         [sourceSnap removeFromSuperview];
                         [transitionContext completeTransition:YES];
                     }];
    
}


@end
