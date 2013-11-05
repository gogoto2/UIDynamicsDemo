//
//  UDDDemoControllerSpringAnimation.m
//  UIDynamicsDemo
//
//  Created by Greg Woods on 11/4/13.
//  Copyright (c) 2013 Undefined Behavior. All rights reserved.
//

#import "UDDDemoControllerSpringAnimation.h"

@interface UDDDemoControllerSpringAnimation ()

@end

@implementation UDDDemoControllerSpringAnimation

- (void)viewDidLoad
{
    // Not actually related to UIKit Dynamics, but the CocoaHeads attendees
    // wanted to see the new UIView animation method in action. So here you go.
    
    square = [self makeSquareImageView];
    square.center = CGPointMake(self.view.center.x, self.view.bounds.size.height - square.bounds.size.height);
    [self.view addSubview:square];
    
    [UIView animateWithDuration:3.0 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0 options:0 animations:^{
        square.center = CGPointMake(self.view.center.x, 200);
    } completion:^(BOOL finished) {
        
    }];
 
    [super viewDidLoad];
}

@end
