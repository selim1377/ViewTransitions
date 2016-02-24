//
//  ImageTransition.h
//  ViewControllerTransition
//
//  Created by Selım on 24/02/16.
//  Copyright © 2016 PeakGames. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ImageTransition : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic,strong) UIView *viewToSnapshot;
@property (nonatomic,strong) UIView *viewToOverlay;

@end
