//
//  DoubleTapViewController.h
//  ViewControllerTransition
//
//  Created by Selım on 23/02/16.
//  Copyright © 2016 PeakGames. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DoubleTapViewController : UIViewController <UIViewControllerTransitioningDelegate, UINavigationControllerDelegate>

@property (nonatomic,strong) IBOutlet id <UIViewControllerAnimatedTransitioning> presentingTransitionDelegate;
@property (nonatomic,strong) IBOutlet id <UIViewControllerAnimatedTransitioning> dismissingTransitionDelegate;

@end
