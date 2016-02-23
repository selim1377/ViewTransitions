//
//  ModalPresentationTransition.m
//  ViewControllerTransition
//
//  Created by Selım on 23/02/16.
//  Copyright © 2016 PeakGames. All rights reserved.
//

#import "ModalPresentationTransition.h"

@implementation ModalPresentationTransition

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 1.0;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *source = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *target = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    CGRect finalFrame     = [transitionContext finalFrameForViewController:target];
    CGRect initialFrame   = CGRectOffset(finalFrame, 0, finalFrame.size.width);
    
    target.view.frame = initialFrame;
    [containerView addSubview:target.view];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                          delay:0.0
         usingSpringWithDamping:0.4
          initialSpringVelocity:0.0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         source.view.alpha = 0.5f;
                         target.view.frame = finalFrame;
         }
                     completion:^(BOOL finished) {
             
                         [transitionContext completeTransition:YES];
                         source.view.alpha = 1.0f;
                         
         }];
    
}

@end
