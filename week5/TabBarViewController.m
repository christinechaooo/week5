//
//  TabBarViewController.m
//  week5
//
//  Created by Christine Chao on 7/3/14.
//  Copyright (c) 2014 Christine Chao. All rights reserved.
//

#import "TabBarViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIView *tabBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 524, 320, 44)];
    [tabBarView setBackgroundColor:[UIColor colorWithRed:51.0/255.0 green:66.0/255.0 blue:86.0/255.0 alpha:1]];
    [self.view addSubview:tabBarView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
