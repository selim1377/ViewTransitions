//
//  CubeTransition.h
//  ViewControllerTransition
//
//  Created by Selım on 23/02/16.
//  Copyright © 2016 PeakGames. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CubeTransition : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic,strong) NSNumber *reverse;

@end
