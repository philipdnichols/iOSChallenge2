//
//  PNSecondViewController.m
//  iOSChallenge2
//
//  Created by Philip Nichols on 8/17/14.
//  Copyright (c) 2014 Phil Nichols. All rights reserved.
//

#import "PNSecondViewController.h"
#import "Chameleon.h"

@implementation PNSecondViewController

- (CAGradientLayer *)gradient
{
    if (!_gradient) {
        CAGradientLayer *gradient = [CAGradientLayer layer];
        gradient.colors = @[(id)[UIColor flatForestGreenColor].CGColor, (id)[UIColor flatForestGreenColorDark].CGColor];
        gradient.locations = @[@0.0, @0.3];
        gradient.startPoint = CGPointMake(0.8, 0.2);
        gradient.endPoint = CGPointMake(0.0, 1.0);
        gradient.frame = self.view.frame;
        _gradient = gradient;
    }
    return _gradient;
}

#pragma mark - Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - IBActions

- (IBAction)goBackButtonTapped {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:NULL];
}

@end
