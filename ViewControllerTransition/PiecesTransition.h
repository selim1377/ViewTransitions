//
//  PiecesTransition.h
//  ViewControllerTransition
//
//  Created by Selim on 24.02.16.
//  Copyright © 2016 PeakGames. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PiecesTransition : UIPercentDrivenInteractiveTransition <UIViewControllerAnimatedTransitioning>

-(void)setupViewController:(UIViewController *)viewController;

@end
