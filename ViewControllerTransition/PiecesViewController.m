//
//  PiecesViewController.m
//  ViewControllerTransition
//
//  Created by Selim on 24.02.16.
//  Copyright © 2016 PeakGames. All rights reserved.
//

#import "PiecesViewController.h"
#import "PiecesTransition.h"

@implementation PiecesViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    for (UIGestureRecognizer *gesture  in [self.view gestureRecognizers]) {
        [self.view removeGestureRecognizer:gesture];
    }
    
    PiecesTransition *transition = (PiecesTransition *)self.dismissingInteractiveDelegate;
    [transition setupViewController:self];
    
    self.dismissingTransitionDelegate = transition;
}


-(id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator
{
    return self.dismissingInteractiveDelegate;
}

-(id<UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id<UIViewControllerAnimatedTransitioning>)animator
{
    return nil;
}

- (IBAction)dismiss:(id)sender
{
    self.dismissingInteractiveDelegate = nil;
    
    [self dismissViewControllerAnimated:YES
                             completion:NULL];
}
@end
