//
//  TrendingViewController.m
//  week5
//
//  Created by Christine Chao on 7/4/14.
//  Copyright (c) 2014 Christine Chao. All rights reserved.
//

#import "ActivityViewController.h"

@interface ActivityViewController ()

@end

@implementation ActivityViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self.view setBackgroundColor:[UIColor purpleColor]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 524)];
    UIImage *view = [UIImage imageNamed:@"activityView"];
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 524)];
    imgView.image = view;
    scrollView.contentSize = imgView.frame.size;
    [scrollView addSubview:imgView];
    [self.view addSubview:scrollView];
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
