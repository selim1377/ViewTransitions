//
//  PiecesViewController.h
//  ViewControllerTransition
//
//  Created by Selim on 24.02.16.
//  Copyright © 2016 PeakGames. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DoubleTapViewController.h"

@interface PiecesViewController : DoubleTapViewController

@property (nonatomic,strong) IBOutlet id <UIViewControllerInteractiveTransitioning> dismissingInteractiveDelegate;
- (IBAction)dismiss:(id)sender;

@end
