//
//  ProfileViewController.h
//  ViewControllerTransition
//
//  Created by Selım on 24/02/16.
//  Copyright © 2016 PeakGames. All rights reserved.
//

#import "DoubleTapViewController.h"

@interface ProfileViewController : DoubleTapViewController

@property (weak, nonatomic) UIView *snapshot;
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;

@end
