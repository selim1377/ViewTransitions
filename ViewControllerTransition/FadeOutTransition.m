//
//  FadeOutTransition.m
//  ViewControllerTransition
//
//  Created by Selım on 23/02/16.
//  Copyright © 2016 PeakGames. All rights reserved.
//

#import "FadeOutTransition.h"

@implementation FadeOutTransition

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 1.0;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *source = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         source.view.alpha = 0.0f;
                     }
                     completion:^(BOOL finished) {
                         
                         [transitionContext completeTransition:YES];
                     }];
    
}


@end
