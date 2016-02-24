//
//  ProfileViewController.m
//  ViewControllerTransition
//
//  Created by Selım on 24/02/16.
//  Copyright © 2016 PeakGames. All rights reserved.
//

#import "ProfileViewController.h"
#import "ImageTransition.h"

@implementation ProfileViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
 
    if (!self.presentingTransitionDelegate) {
        
        ImageTransition *imageTransition = [ImageTransition new];
        self.presentingTransitionDelegate = imageTransition;
    }
}

#pragma mark - Navigation Delegate

-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                 animationControllerForOperation:(UINavigationControllerOperation)operation
                                              fromViewController:(UIViewController *)fromVC
                                                toViewController:(UIViewController *)toVC
{
    if (operation == UINavigationControllerOperationPush) {
        
        ImageTransition *imageTransition = [ImageTransition new];
        self.presentingTransitionDelegate = imageTransition;
        
        return self.presentingTransitionDelegate;
    }
    else if (operation == UINavigationControllerOperationPop)
    {
        return self.dismissingTransitionDelegate;
    }
    
    return nil;
}

@end
