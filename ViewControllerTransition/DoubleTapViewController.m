//
//  DoubleTapViewController.m
//  ViewControllerTransition
//
//  Created by Selım on 23/02/16.
//  Copyright © 2016 PeakGames. All rights reserved.
//

#import "DoubleTapViewController.h"

@implementation DoubleTapViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    UITapGestureRecognizer *doubletap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss:)];
    doubletap.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:doubletap];
    
    
}


-(void)dismiss:(UIGestureRecognizer *)gesture
{
    self.navigationController.delegate = nil;
    
    [self dismissViewControllerAnimated:YES
                             completion:NULL];
}

#pragma mark - TransitioningDelegate

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return self.presentingTransitionDelegate;
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return self.dismissingTransitionDelegate;
}

@end
