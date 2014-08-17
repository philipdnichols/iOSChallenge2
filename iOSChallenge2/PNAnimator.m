//
//  PNAnimator.m
//  iOSChallenge2
//
//  Created by Philip Nichols on 8/17/14.
//  Copyright (c) 2014 Phil Nichols. All rights reserved.
//

#import "PNAnimator.h"
#import "PNHomeViewController.h"
#import "PNSecondViewController.h"

@implementation PNAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    if (self.isPresenting) {
        return self.presentationDuration;
    } else {
        return self.dismissalDuration;
    }
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    if (self.isPresenting) {
        [self executePresentationAnimation:transitionContext];
    } else {
        [self executeDismissalAnimation:transitionContext];
    }
}

- (void)executePresentationAnimation:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIView *inView = [transitionContext containerView];
    
    PNSecondViewController *secondViewController = (PNSecondViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    PNHomeViewController *homeViewController = (PNHomeViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    [inView addSubview:secondViewController.view];
    
    CGPoint centerOffScreenRight = inView.center;
    CGPoint centerOffScreenLeft = inView.center;
    
    centerOffScreenRight.x += inView.frame.size.width;
    centerOffScreenLeft.x -= inView.frame.size.width;
    
    secondViewController.view.center = centerOffScreenRight;
    [inView.layer insertSublayer:homeViewController.gradient atIndex:0];
    
    [UIView animateWithDuration:self.presentationDuration
                     animations:^{
                         homeViewController.view.center = centerOffScreenLeft;
                         secondViewController.view.center = inView.center;
                     }
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:(self.dismissalDuration / 2)
                                          animations:^{
                                              [secondViewController.view.layer insertSublayer:secondViewController.gradient atIndex:0];
                                          }
                                          completion:^(BOOL finished) {
                                              [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                                          }];
                     }];
}

- (void)executeDismissalAnimation:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIView *inView = [transitionContext containerView];
    
    PNHomeViewController *homeViewController = (PNHomeViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    PNSecondViewController *secondViewController = (PNSecondViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    [inView addSubview:homeViewController.view];
    
    CGPoint centerOffScreenRight = inView.center;
    CGPoint centerOffScreenLeft = inView.center;
    
    centerOffScreenRight.x += inView.frame.size.width;
    centerOffScreenLeft.x -= inView.frame.size.width;
    
    homeViewController.view.center = centerOffScreenLeft;
    [inView.layer insertSublayer:secondViewController.gradient atIndex:0];
    
    [UIView animateWithDuration:self.dismissalDuration
                     animations:^{
                         secondViewController.view.center = centerOffScreenRight;
                         homeViewController.view.center = inView.center;
                     }
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:(self.dismissalDuration / 2)
                                          animations:^{
                                              [homeViewController.view.layer insertSublayer:homeViewController.gradient atIndex:0];
                                          }
                                          completion:^(BOOL finished) {
                                              [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                                          }];
                     }];
}

@end
