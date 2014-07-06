//
//  TabBarViewController.m
//  week5
//
//  Created by Christine Chao on 7/3/14.
//  Copyright (c) 2014 Christine Chao. All rights reserved.
//

#import "TabBarViewController.h"
#import "HomeViewController.h"
#import "SearchViewController.h"
#import "CreateViewController.h"
#import "AccountViewController.h"
#import "ActivityViewController.h"

@interface TabBarViewController ()

@property (nonatomic, assign) BOOL isTooltipShow;
@property (nonatomic, strong) UIView *mainView;
@property (nonatomic, strong) UIView *currentView;
@property (nonatomic, strong) UIImageView *tooltip;
@property (nonatomic, strong) HomeViewController *homeViewController;
@property (nonatomic, strong) SearchViewController *searchViewController;
@property (nonatomic, strong) CreateViewController *createViewController;
@property (nonatomic, strong) AccountViewController *accountViewController;
@property (nonatomic, strong) ActivityViewController *activityViewController;

- (void)buttonAction:(id)sender;
- (void)tooltipShow;
- (void)tooltipHide;
- (void)checkTooltipShow;

@end

@implementation TabBarViewController

id currentButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.homeViewController = [[HomeViewController alloc] init];
        self.searchViewController = [[SearchViewController alloc] init];
        self.createViewController = [[CreateViewController alloc] init];
        self.accountViewController = [[AccountViewController alloc] init];
        self.activityViewController = [[ActivityViewController alloc] init];
//        UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:self.trendingViewController];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.mainView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    [self.mainView addSubview:self.homeViewController.view];
    
    UIView *tabBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 524, 320, 44)];
    [tabBarView setBackgroundColor:[UIColor colorWithRed:51.0/255.0 green:66.0/255.0 blue:86.0/255.0 alpha:1]];
    
    CGFloat contentOffSet = 8.0f;
    /*UIButton *homeButton = [[UIButton alloc] initWithFrame:CGRectMake(contentOffSet, 6, 48, 34)];
    [homeButton setBackgroundImage:[UIImage imageNamed:@"home"] forState:UIControlStateNormal];
    contentOffSet += homeButton.frame.size.width + 16;
    [tabBarView addSubview:homeButton];
    
    UIButton *searchButton = [[UIButton alloc] initWithFrame:CGRectMake(contentOffSet, 6, 48, 34)];
    [searchButton setBackgroundImage:[UIImage imageNamed:@"search"] forState:UIControlStateNormal];
    contentOffSet += searchButton.frame.size.width + 16;
    [tabBarView addSubview:searchButton];
    
    UIButton *createButton = [[UIButton alloc] initWithFrame:CGRectMake(contentOffSet, 6, 48, 34)];
    [createButton setBackgroundImage:[UIImage imageNamed:@"create"] forState:UIControlStateNormal];
    contentOffSet += createButton.frame.size.width + 16;
    [tabBarView addSubview:createButton];
    
    UIButton *accountButton = [[UIButton alloc] initWithFrame:CGRectMake(contentOffSet, 6, 48, 34)];
    [accountButton setBackgroundImage:[UIImage imageNamed:@"account"] forState:UIControlStateNormal];
    contentOffSet += accountButton.frame.size.width + 16;
    [tabBarView addSubview:accountButton];
    
    UIButton *trendingButton = [[UIButton alloc] initWithFrame:CGRectMake(contentOffSet, 6, 48, 34)];
    [trendingButton setBackgroundImage:[UIImage imageNamed:@"trending"] forState:UIControlStateNormal];
    contentOffSet += trendingButton.frame.size.width + 16;
    [tabBarView addSubview:trendingButton];*/
    
    NSArray *imageNames = [NSArray arrayWithObjects:@"home-disabled",
                           @"search-disabled",@"create", @"account-disabled", @"activity-disabled", nil];
    int count = 1;
	for (NSString *singleImageFilename in imageNames) {
		CGRect buttonViewFrame = CGRectMake(contentOffSet, 6, 48, 34);
        UIButton *customButton = [[UIButton alloc] initWithFrame:CGRectMake(contentOffSet, 6, 48, 34)];
//		UIButton *customButton = [UIButton buttonWithType:UIButtonTypeCustom];
		[customButton setBackgroundImage:[UIImage imageNamed:singleImageFilename] forState:UIControlStateNormal];
        [customButton setBackgroundImage:[UIImage imageNamed:singleImageFilename] forState:UIControlStateHighlighted];
//        NSLog(@"%@", singleImageFilename);
		[customButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
		customButton.frame = buttonViewFrame;
		customButton.tag = count;
		
        if(count == 1) {
            currentButton = customButton;
        }
        
        [self buttonAction:(currentButton)];
		[tabBarView addSubview:customButton];
		contentOffSet += customButton.frame.size.width + 16;
		
        count++;
	}
    
    UIImage *tooltipImg = [UIImage imageNamed:@"tooltip"];
    self.tooltip = [[UIImageView alloc] initWithFrame:CGRectMake(9, 467, 171, 62)];
    self.tooltip.image = tooltipImg;
    self.isTooltipShow = YES;
    [self tooltipShow];
    
    [self.view addSubview:self.mainView];
    [self.view addSubview:tabBarView];
    [self.view addSubview:self.tooltip];
    
}

- (void)buttonAction:(id)sender {
    
    switch ([sender tag]) {
        case 1:
            [self checkTooltipShow];
            [sender setSelected:YES];
            currentButton = sender;
            [sender setBackgroundImage:[UIImage imageNamed:@"home"] forState:UIControlStateSelected];
            [self.mainView addSubview:self.homeViewController.view];
            break;
        case 2:
            [currentButton setSelected:NO];
            [sender setSelected:YES];
            currentButton = sender;
            self.isTooltipShow = NO;
            [self tooltipHide];
            [sender setBackgroundImage:[UIImage imageNamed:@"search"] forState:UIControlStateSelected];
            [self.mainView addSubview:self.searchViewController.view];
            break;
        case 3:
            [sender setBackgroundImage:[UIImage imageNamed:@"create"] forState:UIControlStateSelected];
            [self.createViewController transitionIn];
            [self.view addSubview:self.createViewController.view];
            break;
        case 4:
            [self checkTooltipShow];
            [sender setSelected:YES];
            currentButton = sender;
            [sender setBackgroundImage:[UIImage imageNamed:@"account"] forState:UIControlStateSelected];
            [self.mainView addSubview:self.accountViewController.view];
            break;
        case 5:
            [self checkTooltipShow];
            [sender setSelected:YES];
            currentButton = sender;
            [sender setBackgroundImage:[UIImage imageNamed:@"activity"] forState:UIControlStateSelected];
            [self.mainView addSubview:self.activityViewController.view];
            break;
    }
}

- (void)checkTooltipShow {
    [currentButton setSelected:NO];
    
    if(self.isTooltipShow != YES) {
        self.isTooltipShow = YES;
        [self tooltipShow];
    }
}

- (void)tooltipShow {
    [self.view addSubview:self.tooltip];
    [UIView animateWithDuration:1 delay:0 options: UIViewAnimationOptionCurveEaseOut |  UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse animations:^{
        self.tooltip.center = CGPointMake(self.tooltip.center.x, self.tooltip.center.y - 5);
    } completion:nil];
}

- (void)tooltipHide {
    [self.tooltip removeFromSuperview];
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
