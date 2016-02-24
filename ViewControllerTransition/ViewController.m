//
//  ViewController.m
//  ViewControllerTransition
//
//  Created by Selım on 08/12/15.
//  Copyright © 2015 PeakGames. All rights reserved.
//

#import "ViewController.h"
#import "SettingTransition.h"
#import "DoubleTapViewController.h"
#import "ProfileViewController.h"
#import "ImageTransition.h"

@interface ViewController () <UIViewControllerTransitioningDelegate>

- (IBAction)openDestination:(id)sender;
- (IBAction)modelPresentation:(id)sender;

@property (nonatomic,strong) SettingTransition *transition;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.transition = [SettingTransition new];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(pushImage:)];
    tap.numberOfTapsRequired = 2;
    [self.imageView addGestureRecognizer:tap];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    self.transition.reverse = NO;
    return self.transition;
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    self.transition.reverse = YES;
    return self.transition;
}

#pragma mark - presentation animation delegate

- (IBAction)openDestination:(id)sender
{
    UIViewController *destination = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"destination"];
    destination.transitioningDelegate = self;
    destination.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:destination animated:YES completion:nil];
}

- (IBAction)modelPresentation:(id)sender
{
    DoubleTapViewController *destination = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"modalPresentation"];
    destination.modalPresentationStyle = UIModalPresentationFullScreen;
    destination.transitioningDelegate = destination;
    [self presentViewController:destination animated:YES completion:nil];
}

-(void)pushImage:(UITapGestureRecognizer *)gesture
{
    ProfileViewController *profile = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"imageTransition"];
    profile.snapshot = self.imageView;
    profile.transitioningDelegate = profile;
    self.navigationController.delegate = profile;
    [self.navigationController pushViewController:profile animated:YES];
    
}

@end
