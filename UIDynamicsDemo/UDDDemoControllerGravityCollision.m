//
//  UDDDemoControllerGravityCollision.m
//  UIDynamicsDemo
//
//  Created by Greg Woods on 11/4/13.
//  Copyright (c) 2013 Undefined Behavior. All rights reserved.
//

#import "UDDDemoControllerGravityCollision.h"

@interface UDDDemoControllerGravityCollision ()

@end

@implementation UDDDemoControllerGravityCollision

- (void)viewDidLoad
{
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    square = [self makeSquareImageView];
    square.center = CGPointMake(self.view.center.x, 150);
    [self.view addSubview:square];
    
    square2 = [self makeSquareImageView];
    square2.center = CGPointMake(self.view.center.x-square.bounds.size.width/2, self.view.bounds.size.height-square2.bounds.size.height/2);
    [self.view addSubview:square2];
    
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[square]];
    // 1 unit of UIKit Gravity = 1000 p/s2
    gravityBehavior.magnitude = 1.25;
    [animator addBehavior:gravityBehavior];
    
    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[square, square2]];
    collisionBehavior.collisionMode = UICollisionBehaviorModeEverything;
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    [animator addBehavior:collisionBehavior];
    
    self.animator = animator;
    [super viewDidLoad];
}

@end
