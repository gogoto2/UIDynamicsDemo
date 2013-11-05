//
//  UDDDemoControllerSnap.m
//  UIDynamicsDemo
//
//  Created by Greg Woods on 11/4/13.
//  Copyright (c) 2013 Undefined Behavior. All rights reserved.
//

#import "UDDDemoControllerSnap.h"
#import "UDDDynamicBehaviorGravCol.h"

@interface UDDDemoControllerSnap ()
@property (nonatomic, strong) UISnapBehavior *snapBehavior;
@end

@implementation UDDDemoControllerSnap

- (void)viewDidLoad
{
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    square = [self makeSquareImageView];
    square.center = CGPointMake(self.view.center.x, 150);
    [self.view addSubview:square];
    
    square2 = [self makeSquareImageView];
    square2.center = CGPointMake(self.view.center.x-square.bounds.size.width/2, self.view.bounds.size.height-square2.bounds.size.height/2);
    [self.view addSubview:square2];
    
    UDDDynamicBehaviorGravCol *gravColBehavior = [[UDDDynamicBehaviorGravCol alloc] initWithItems:@[square, square2]];
    [animator addBehavior:gravColBehavior];
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self.view addGestureRecognizer:tapRecognizer];
    
    self.animator = animator;
    [super viewDidLoad];
}

-(void)handleTap:(UITapGestureRecognizer *)recognizer
{
    CGPoint point = [recognizer locationInView:self.view];
    [self.animator removeBehavior:self.snapBehavior];
    UISnapBehavior *snapBehavior = [[UISnapBehavior alloc] initWithItem:square snapToPoint:point];
    snapBehavior.damping = 0.6;
    [self.animator addBehavior:snapBehavior];
    self.snapBehavior = snapBehavior;
}

@end
