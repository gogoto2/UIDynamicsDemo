//
//  UDDDemoControllerBase.h
//  UIDynamicsDemo
//
//  Created by Greg Woods on 11/4/13.
//  Copyright (c) 2013 Undefined Behavior. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UDDDemoController : UIViewController
{
    UIImageView *square;
    UIImageView *square2;
}

@property (nonatomic, strong) UIDynamicAnimator *animator;

-(UIImageView *)makeSquareImageView;

@end
