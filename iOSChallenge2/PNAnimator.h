//
//  PNAnimator.h
//  iOSChallenge2
//
//  Created by Philip Nichols on 8/17/14.
//  Copyright (c) 2014 Phil Nichols. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PNAnimator : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic) BOOL isPresenting;
@property (nonatomic) NSTimeInterval presentationDuration;
@property (nonatomic) NSTimeInterval dismissalDuration;

@end
