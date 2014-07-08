//
//  SearchViewController.m
//  week5
//
//  Created by Christine Chao on 7/4/14.
//  Copyright (c) 2014 Christine Chao. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()

@property(nonatomic, strong)UIImageView *loadingAnimationView;
@property(nonatomic, strong)UIScrollView *scrollView;
@property(nonatomic, strong)NSTimer *timer;

- (void)onTimer:(id)sender;


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
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 524)];
    UIImage *view = [UIImage imageNamed:@"searchView"];
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 1237)];
    imgView.image = view;
    self.scrollView.contentSize = imgView.frame.size;
    self.scrollView.alpha = 0;
    [self.scrollView addSubview:imgView];
    
    NSArray *loadingImageNames = @[@"loading-1", @"loading-2", @"loading-3"];
    NSMutableArray *loadingImages = [[NSMutableArray alloc] init];
    for (int i = 0; i < loadingImageNames.count; i++) {
        [loadingImages addObject:[UIImage imageNamed:[loadingImageNames objectAtIndex:i]]];
    }
    
    self.loadingAnimationView = [[UIImageView alloc] initWithFrame:CGRectMake(130, 260, 61, 19)];
    self.loadingAnimationView.animationImages = loadingImages;
    self.loadingAnimationView.animationDuration = 0.6;
         
    [self.view addSubview:self.loadingAnimationView];
    [self.loadingAnimationView startAnimating];
    [self.view addSubview:self.scrollView];
    [self.view addSubview:statusBarView];
}

- (void)viewDidAppear:(BOOL)animated {
    if(!self.timer) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(onTimer:) userInfo:nil repeats:NO];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onTimer:(id)sender {
    NSLog(@"!!");
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.scrollView.alpha = 1;
    } completion:nil];
    
    [self.loadingAnimationView removeFromSuperview];
    [self.loadingAnimationView stopAnimating];
    
    [self.timer invalidate];
    self.timer = nil;
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
