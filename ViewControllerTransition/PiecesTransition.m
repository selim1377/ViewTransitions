//
//  PiecesTransition.m
//  ViewControllerTransition
//
//  Created by Selim on 24.02.16.
//  Copyright © 2016 PeakGames. All rights reserved.
//

#import "PiecesTransition.h"
#import "PiecesViewController.h"

@interface PiecesTransition ()

@property (nonatomic,assign) UIViewController *viewController;
@property (nonatomic,strong) NSValue *initialPoint;
@end

@implementation PiecesTransition

-(void)setupViewController:(UIViewController *)viewController
{
    UIPanGestureRecognizer *gesture = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                                              action:@selector(pan:)];
    
    [viewController.view addGestureRecognizer:gesture];
    self.viewController = viewController;
    
}

-(void)pan:(UIPanGestureRecognizer *)gesture
{
    CGPoint location = [gesture locationInView:self.viewController.view];
    float delta = (float)(location.x - self.initialPoint.CGPointValue.x) / 150.0 ;
    delta = fabsf(delta);
    
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:
            
            [self.viewController dismissViewControllerAnimated:YES
                                                    completion:NULL];
            
            self.initialPoint = [NSValue valueWithCGPoint:location];
            break;
            
        case UIGestureRecognizerStateChanged:
            
            delta = fmaxf(delta, 0.0);
            delta = fminf(delta, 1.0);
            [self updateInteractiveTransition:delta];
            
            break;
            
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
            
            if (gesture.state == UIGestureRecognizerStateCancelled || delta < 0.3) {
                [self cancelInteractiveTransition];
            }
            else
            {
                [self finishInteractiveTransition];
            }

            self.initialPoint = nil;
            
            break;
            
        default:
            break;
    }
}

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.7;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    PiecesViewController *source = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *target = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    
    UIView *view1 = [source.view viewWithTag:1];
    UIView *view2 = [source.view viewWithTag:2];
    UIView *view3 = [source.view viewWithTag:3];
    UIView *view4 = [source.view viewWithTag:4];
    
    NSArray *views  = [NSArray arrayWithObjects:view1,view2,view3,view4, nil];
    
    CGFloat distance = 140.0;
    
    NSArray *targetFrames = [NSArray arrayWithObjects:[NSValue valueWithCGRect:CGRectOffset(view1.frame, -distance, -distance)],
                       [NSValue valueWithCGRect:CGRectOffset(view2.frame, distance, -distance)],
                       [NSValue valueWithCGRect:CGRectOffset(view3.frame, -distance, distance)],
                       [NSValue valueWithCGRect:CGRectOffset(view4.frame, distance, distance)],nil];
    
    
    [containerView insertSubview:target.view belowSubview:source.view];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         
                         for (NSInteger index = 0; index < views.count; index++) {
                             
                             UIView *view = views[index];
                             CGRect frame = [targetFrames[index] CGRectValue];
                             view.frame = frame;
                         }
                         
                         source.view.alpha = 0.0f;
                         
                     } completion:^(BOOL finished) {
                         
                         if (![transitionContext transitionWasCancelled]) {
                            [source.view removeFromSuperview];
                            [transitionContext completeTransition:YES];
                         }
                         else
                         {
                             [target.view removeFromSuperview];
                             [transitionContext completeTransition:NO];
                         }
                         
                     }];
}

@end
