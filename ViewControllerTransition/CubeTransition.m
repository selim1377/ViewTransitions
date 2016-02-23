//
//  CubeTransition.m
//  ViewControllerTransition
//
//  Created by Selım on 23/02/16.
//  Copyright © 2016 PeakGames. All rights reserved.
//

#import "CubeTransition.h"

@implementation CubeTransition


-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 2.0;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIView *containerView = [transitionContext containerView];
    
    UIViewController *fromViewController    = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController      = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *toView = toViewController.view;
    UIView *fromView = fromViewController.view;
    
    [containerView addSubview:fromView];
    
    CGFloat direction = 1;
    CGFloat constant  = -0.005;
    
    toView.layer.anchorPoint = CGPointMake(0, 0.5);
    fromView.layer.anchorPoint = CGPointMake(1, 0.5);
    
    CATransform3D fromTransform =  CATransform3DMakeRotation(direction * M_PI_2, 0.0, 1.0, 0.0);
    CATransform3D toTransform = CATransform3DMakeRotation(-direction * M_PI_2, 0.0, 1.0, 0.0);
    fromTransform.m34 = constant;
    toTransform.m34 = constant;
    
    containerView.transform = CGAffineTransformMakeTranslation(direction * containerView.frame.size.width / 2.0, 0);
    toView.layer.transform = toTransform;
    [containerView addSubview:toView];
    
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                          delay:0.0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         containerView.transform = CGAffineTransformMakeTranslation(-direction * containerView.frame.size.width / 2.0, 0);
                         fromView.layer.transform = fromTransform;
                         toView.layer.transform = CATransform3DIdentity;
                     }
                     completion:^(BOOL finished) {
                         
                         containerView.transform = CGAffineTransformIdentity;
                         fromView.layer.transform = CATransform3DIdentity;
                         toView.layer.transform = CATransform3DIdentity;
                         
                         fromView.layer.anchorPoint = CGPointMake(0.5, 0.5);
                         toView.layer.anchorPoint = CGPointMake(0.5, 0.5);
                         
                         [transitionContext completeTransition:YES];
                     }];
    
}

//-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
//{
//    UIView *containerView = [transitionContext containerView];
//    
//    UIViewController *source = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
//    UIViewController *target = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
//    
//    CGFloat direction = 1.0;
//    CGFloat constant = -0.005;
//    
//    source.view.layer.anchorPoint = CGPointMake(0, 0.5);
//    target.view.layer.anchorPoint = CGPointMake(1, 0.5);
//    
//    CATransform3D sourceTransform = CATransform3DMakeRotation(direction * (M_PI_2), 0.0, 1.0, 0.0);
//    CATransform3D targetTransform = CATransform3DMakeRotation(-direction * (M_PI_2), 0.0, 1.0, 0.0);
//    sourceTransform.m34 = constant;
//    targetTransform.m34 = constant;
//    
//    containerView.transform = CGAffineTransformMakeTranslation(direction * containerView.frame.size.width / 2.0, 0);
//    target.view.layer.transform = targetTransform;
//    
//    [containerView addSubview:target.view];
//    
//    [UIView animateWithDuration:[self transitionDuration:transitionContext]
//                          delay:0.0
//                        options:UIViewAnimationOptionCurveEaseOut
//                     animations:^{
//                         containerView.transform = CGAffineTransformMakeTranslation(-direction * containerView.frame.size.width / 2.0, 0);
//                         source.view.layer.transform = sourceTransform;
//                         target.view.layer.transform = CATransform3DIdentity;
//                     }
//                     completion:^(BOOL finished) {
//                         
//                         containerView.transform = CGAffineTransformIdentity;
//                         source.view.layer.transform = CATransform3DIdentity;
//                         target.view.layer.transform = CATransform3DIdentity;
//                         
//                         source.view.layer.anchorPoint = CGPointMake(0.5, 0.5);
//                         target.view.layer.anchorPoint = CGPointMake(0.5, 0.5);
//                         
//                         [transitionContext completeTransition:YES];
//                         
//                     }];
//    
//}

@end
