//
//  PNViewController.m
//  iOSChallenge2
//
//  Created by Philip Nichols on 8/17/14.
//  Copyright (c) 2014 Phil Nichols. All rights reserved.
//

#import "PNHomeViewController.h"
#import "PNAnimator.h"
#import "PNSecondViewController.h"
#import "UIColor+Chameleon.h"

@interface PNHomeViewController () <UIViewControllerTransitioningDelegate>

@property (strong, nonatomic) PNAnimator *animator;

@end

@implementation PNHomeViewController

#pragma mark - Properties

- (CAGradientLayer *)gradient
{
    if (!_gradient) {
        CAGradientLayer *gradient = [CAGradientLayer layer];
        gradient.colors = @[(id)[UIColor flatNavyBlueColor].CGColor, (id)[UIColor flatNavyBlueColorDark].CGColor];
        gradient.locations = @[@0.0, @0.3];
        gradient.startPoint = CGPointMake(0.8, 0.2);
        gradient.endPoint = CGPointMake(0.0, 1.0);
        gradient.frame = self.view.frame;
        _gradient = gradient;
    }
    return _gradient;
}

- (PNAnimator *)animator
{
    if (!_animator) {
        _animator = [[PNAnimator alloc] init];
        _animator.presentationDuration = 1.0;
        _animator.dismissalDuration = 1.0;
    }
    return _animator;
}

#pragma mark - Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view.layer insertSublayer:self.gradient atIndex:0];
}

#pragma mark - IBActions

- (IBAction)goForwardButtonTapped {
    PNSecondViewController *secondViewController = [[PNSecondViewController alloc] initWithNibName:@"SecondVC" bundle:nil];
    secondViewController.transitioningDelegate = self;
    secondViewController.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:secondViewController animated:YES completion:NULL];
}

#pragma mark - UIViewControllerTransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source
{
    self.animator.isPresenting = YES;
    
    return self.animator;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    self.animator.isPresenting = NO;
    
    return self.animator;
}

@end
