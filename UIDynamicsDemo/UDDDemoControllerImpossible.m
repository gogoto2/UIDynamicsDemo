//
//  UDDDemoControllerImpossible.m
//  UIDynamicsDemo
//
//  Created by Greg Woods on 11/4/13.
//  Copyright (c) 2013 Undefined Behavior. All rights reserved.
//

#import "UDDDemoControllerImpossible.h"

@interface UDDDemoControllerImpossible ()

@end

@implementation UDDDemoControllerImpossible

-(void)viewDidLoad
{
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    square = [self makeSquareImageView];
    square.center = self.view.center;
    [self.view addSubview:square];
    
    square2 = [self makeSquareImageView];
    square2.center = self.view.center;
    [self.view addSubview:square2];
    
    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[square, square2]];
    collisionBehavior.collisionMode = UICollisionBehaviorModeEverything;
    
    // create a collision bounding box too small for the squares to fit
    CGRect smallBounds = CGRectMake(self.view.center.x-50, self.view.center.y-50, 100, 100);
    UIBezierPath *smallBoundsPath = [UIBezierPath bezierPathWithRect:smallBounds];
    [collisionBehavior addBoundaryWithIdentifier:@"smallBounds" forPath:smallBoundsPath];
    
    [animator addBehavior:collisionBehavior];

    self.animator = animator;
    [super viewDidLoad];
}

@end
