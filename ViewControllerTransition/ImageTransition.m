//
//  ImageTransition.m
//  ViewControllerTransition
//
//  Created by Selım on 24/02/16.
//  Copyright © 2016 PeakGames. All rights reserved.
//

#import "ImageTransition.h"
#import "ProfileViewController.h"

@implementation ImageTransition

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 1.0;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    ProfileViewController *target = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    self.viewToSnapshot = target.snapshot;
    self.viewToOverlay  = target.profileImage;
    
    UIView *containerView = [transitionContext containerView];
    
    UIView *snapshot = [self.viewToSnapshot snapshotViewAfterScreenUpdates:NO];
    CGRect newRect = [containerView convertRect:self.viewToSnapshot.frame fromView:self.viewToSnapshot.superview];
    snapshot.frame = newRect;
    
    self.viewToSnapshot.hidden = YES;
    
    target.view.frame = [transitionContext finalFrameForViewController:target];
    target.view.alpha = 0;
    
    self.viewToOverlay.hidden = YES;
    
    [containerView addSubview:target.view];
    [containerView addSubview:snapshot];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        
        // Fade in the second view controller's view
        target.view.alpha = 1.0;
        
        // Move the cell snapshot so it's over the second view controller's image view
        CGRect frame = [containerView convertRect:self.viewToOverlay.frame fromView:target.view];
        snapshot.frame = frame;
    } completion:^(BOOL finished) {
        // Clean up
        self.viewToOverlay.hidden = NO;
        self.viewToSnapshot.hidden = NO;
        [snapshot removeFromSuperview];
        
        // Declare that we've finished
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
}


@end
