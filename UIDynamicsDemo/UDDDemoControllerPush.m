//
//  UDDDemoControllerPush.m
//  UIDynamicsDemo
//
//  Created by Greg Woods on 11/4/13.
//  Copyright (c) 2013 Undefined Behavior. All rights reserved.
//

#import "UDDDemoControllerPush.h"
#import "UDDDynamicBehaviorGravCol.h"

@interface UDDDemoControllerPush ()
@property (nonatomic, strong) UISnapBehavior *currentBehavior;
@end

@implementation UDDDemoControllerPush

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
    
    self.animator = animator;
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self.view addGestureRecognizer:tapRecognizer];

    [super viewDidLoad];
    
    UIBarButtonItem *pushButton = [[UIBarButtonItem alloc] initWithTitle:@"Apply Force" style:UIBarButtonItemStyleBordered target:self action:@selector(handlePush)];
    self.navigationItem.rightBarButtonItem = pushButton;
}

-(void)handleTap:(UITapGestureRecognizer *)recognizer
{
    CGPoint point = [recognizer locationInView:self.view];
    [self.animator removeBehavior:self.currentBehavior];
    UISnapBehavior *snapBehavior = [[UISnapBehavior alloc] initWithItem:square snapToPoint:point];
    [self.animator addBehavior:snapBehavior];
    self.currentBehavior = snapBehavior;
}

-(void)handlePush
{
    [self.animator removeBehavior:self.currentBehavior];
    UIPushBehavior *pushBehavior = [[UIPushBehavior alloc] initWithItems:@[square] mode:UIPushBehaviorModeInstantaneous];
    
    CGFloat dx = self.view.center.x - square.center.x;
    CGFloat dy = 100 - square.center.y;

    pushBehavior.pushDirection = CGVectorMake(dx, dy);
    
    // 1 UIKit Newton = accelerate a 100x100 view to 100 p/s2
    pushBehavior.magnitude = 5.0;
    [pushBehavior setTargetOffsetFromCenter:UIOffsetMake(-10, -10) forItem:square];
    
    [self.animator addBehavior:pushBehavior];
}

@end
