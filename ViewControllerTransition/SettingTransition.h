//
//  SettingTransition.h
//  ViewControllerTransition
//
//  Created by Selım on 08/12/15.
//  Copyright © 2015 PeakGames. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SettingTransition : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic,assign) BOOL reverse;

@end
