//
//  UDDTableViewController.m
//  UIDynamicsDemo
//
//  Created by Greg Woods on 11/4/13.
//  Copyright (c) 2013 Undefined Behavior. All rights reserved.
//

#import "UDDTableViewController.h"
#import "UDDDemoControllerGravity.h"
#import "UDDDemoControllerGravityCollision.h"
#import "UDDDemoControllerSnap.h"
#import "UDDDemoControllerPush.h"
#import "UDDDemoControllerImpossible.h"
#import "UDDDemoControllerSpringAnimation.h"

@interface UDDTableViewController ()

@end

@implementation UDDTableViewController

static NSString *kUDDTableViewCellIdentifier = @"UDDTableViewCell";

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.title = @"UIKit Dynamics Demo";
        
        demos = @[
                  @"Gravity",
                  @"Gravity + Collision",
                  @"Snap",
                  @"Force",
                  @"Impossible",
                  @"UIView Spring Animation"
                  ];
        
        UINib *tableCellNib = [UINib nibWithNibName:kUDDTableViewCellIdentifier bundle:[NSBundle mainBundle]];
        [self.tableView registerNib:tableCellNib forCellReuseIdentifier:kUDDTableViewCellIdentifier];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [demos count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kUDDTableViewCellIdentifier];
    NSString *demo = demos[indexPath.row];
    cell.textLabel.text = demo;
    cell.detailTextLabel.text = @"";
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UDDDemoController *demoController = nil;
    
    switch(indexPath.row)
    {
        case 0:
            demoController = [[UDDDemoControllerGravity alloc] init];
            break;
        case 1:
            demoController = [[UDDDemoControllerGravityCollision alloc] init];
            break;
        case 2:
            demoController = [[UDDDemoControllerSnap alloc] init];
            break;
        case 3:
            demoController = [[UDDDemoControllerPush alloc] init];
            break;
        case 4:
            demoController = [[UDDDemoControllerImpossible alloc] init];
            break;
        case 5:
            demoController = [[UDDDemoControllerSpringAnimation alloc] init];
        default:
            NSLog(@"Invalid index path %i", indexPath.row);
    }
    
    if(demoController != nil)
    {
        demoController.title = demos[indexPath.row];
        [self.navigationController pushViewController:demoController animated:YES];
    }
    
}

@end
