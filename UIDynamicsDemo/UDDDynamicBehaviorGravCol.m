//
//  UDDDynamicBehaviorGravCol.m
//  UIDynamicsDemo
//
//  Created by Greg Woods on 11/4/13.
//  Copyright (c) 2013 Undefined Behavior. All rights reserved.
//

#import "UDDDynamicBehaviorGravCol.h"

@interface UDDDynamicBehaviorGravCol()

@end

@implementation UDDDynamicBehaviorGravCol

-(id)initWithItems:(NSArray *)items
{
    if(self = [super init])
    {
        UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:items];
        UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:items];
        collisionBehavior.collisionMode = UICollisionBehaviorModeEverything;
        collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
        
        [self addChildBehavior:gravityBehavior];
        [self addChildBehavior:collisionBehavior];
        
//        self.action = ^{
//            NSLog(@"do custom animations here");
//        };
    }
    
    return self;
}

@end
