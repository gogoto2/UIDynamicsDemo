//
//  UDDDemoControllerGravity.m
//  UIDynamicsDemo
//
//  Created by Greg Woods on 11/4/13.
//  Copyright (c) 2013 Undefined Behavior. All rights reserved.
//

#import "UDDDemoControllerGravity.h"

@interface UDDDemoControllerGravity ()

@end

@implementation UDDDemoControllerGravity

- (void)viewDidLoad
{
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    square = [self makeSquareImageView];
    square.center = CGPointMake(self.view.center.x, 150);
    [self.view addSubview:square];
    
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[square]];
    [animator addBehavior:gravityBehavior];
    
    self.animator = animator;
    [super viewDidLoad];
}

@end
