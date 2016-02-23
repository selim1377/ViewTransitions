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
    destination.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:destination animated:YES completion:nil];
}

- (IBAction)modelPresentation:(id)sender
{
    DoubleTapViewController *destination = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"modalPresentation"];
    destination.modalPresentationStyle = UIModalPresentationCustom;
    destination.transitioningDelegate = destination;
    [self presentViewController:destination animated:YES completion:nil];
}
@end
