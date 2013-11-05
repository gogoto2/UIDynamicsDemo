//
//  UDDDemoControllerBase.m
//  UIDynamicsDemo
//
//  Created by Greg Woods on 11/4/13.
//  Copyright (c) 2013 Undefined Behavior. All rights reserved.
//

#import "UDDDemoController.h"

@interface UDDDemoController ()

@end

@implementation UDDDemoController

-(id)init
{
    if(self = [super initWithNibName:nil bundle:nil])
    {
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIImageView *)makeSquareImageView
{
    return [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CocoaHeads"]];
}

@end
