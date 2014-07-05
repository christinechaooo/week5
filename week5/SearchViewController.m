//
//  SearchViewController.m
//  week5
//
//  Created by Christine Chao on 7/4/14.
//  Copyright (c) 2014 Christine Chao. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self.view setBackgroundColor:[UIColor colorWithRed:51.0/255.0 green:70.0/255.0 blue:93.0/255.0 alpha:1]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIView *statusBarView=[[UIView alloc] initWithFrame:CGRectMake(0, 0,320, 20)];
    statusBarView.backgroundColor=[UIColor colorWithRed:51.0/255.0 green:70.0/255.0 blue:93.0/255.0 alpha:1];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 524)];
    UIImage *view = [UIImage imageNamed:@"searchView"];
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 1237)];
    imgView.image = view;
    scrollView.contentSize = imgView.frame.size;
    [scrollView addSubview:imgView];
    
    [self.view addSubview:scrollView];
    [self.view addSubview:statusBarView];
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
