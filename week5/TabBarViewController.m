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
@property (nonatomic, strong) UIView *logInView;
@property (nonatomic, strong) UIImageView *logInTF;
@property (nonatomic, strong) UITextField *emailTF;
@property (nonatomic, strong) HomeViewController *homeViewController;
@property (nonatomic, strong) SearchViewController *searchViewController;
@property (nonatomic, strong) CreateViewController *createViewController;
@property (nonatomic, strong) AccountViewController *accountViewController;
@property (nonatomic, strong) ActivityViewController *activityViewController;

- (void)buttonAction:(id)sender;
- (void)tooltipShow;
- (void)tooltipHide;
- (void)checkTooltipShow;
- (void)didHitLoginButton;
- (void)onLogInCancel:(id)sender;
- (void)hideKeyboard;

@end

@implementation TabBarViewController

id currentButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.homeViewController = [[HomeViewController alloc] init];
        self.homeViewController.delegate = self;
        
        self.searchViewController = [[SearchViewController alloc] init];
        self.createViewController = [[CreateViewController alloc] init];
        
        self.accountViewController = [[AccountViewController alloc] init];
        self.accountViewController.delegate = self;
        
        self.activityViewController = [[ActivityViewController alloc] init];
        self.activityViewController.delegate = self;
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
    
    NSArray *imageNames = [NSArray arrayWithObjects:@"home-disabled",
                           @"search-disabled",@"create", @"account-disabled", @"activity-disabled", nil];
    int count = 1;
	for (NSString *singleImageFilename in imageNames) {
		CGRect buttonViewFrame = CGRectMake(contentOffSet, 6, 48, 34);
        UIButton *customButton = [[UIButton alloc] initWithFrame:CGRectMake(contentOffSet, 6, 48, 34)];
		[customButton setBackgroundImage:[UIImage imageNamed:singleImageFilename] forState:UIControlStateNormal];
        [customButton setBackgroundImage:[UIImage imageNamed:singleImageFilename] forState:UIControlStateHighlighted];
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
    
    self.logInView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    self.logInView.backgroundColor = [UIColor colorWithRed:51.0/255.0 green:70.0/255.0 blue:93.0/255.0 alpha:0];
    
    UIImage *logInImg = [UIImage imageNamed:@"logInTF"];
    self.logInTF = [[UIImageView alloc] initWithFrame:CGRectMake(10, 189, 300, 132)];
    self.logInTF.image = logInImg;
    self.logInTF.layer.opacity = 0;
    self.logInTF.userInteractionEnabled = YES;
    
    self.emailTF = [[UITextField alloc] initWithFrame:CGRectMake(15, 1, 270, 44)];
    self.emailTF.placeholder = @"email";
    self.emailTF.font = [UIFont systemFontOfSize:14];
    self.emailTF.keyboardType = UIKeyboardTypeEmailAddress;
    self.emailTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    //[self.emailTF addTarget:self action:@selector(textFieldChanged:) forControlEvents:UIControlEventEditingChanged];
    
    UITextField *passwordTF = [[UITextField alloc] initWithFrame:CGRectMake(15, 45, 270, 44)];
    passwordTF.placeholder = @"password";
    passwordTF.font = [UIFont systemFontOfSize:14];
    passwordTF.secureTextEntry = YES;
    passwordTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelButton.frame = CGRectMake(0, 88, 150, 44);
    [cancelButton addTarget:self action:@selector(onLogInCancel:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.logInTF addSubview:self.emailTF];
    [self.logInTF addSubview:passwordTF];
    [self.logInTF addSubview:cancelButton];
    [self.logInView addSubview:self.logInTF];
    
    [self.view addSubview:self.mainView];
    [self.view addSubview:tabBarView];
    [self.view addSubview:self.tooltip];
    
}

-(void)didHitLoginButton {
    NSLog(@"LOG IN!!!!");
    
    [self.emailTF becomeFirstResponder];
    [self.view addSubview:self.logInView];
    [UIView animateWithDuration:0.6 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.logInTF.center = CGPointMake(10 + self.logInTF.frame.size.width / 2, 109 + self.logInTF.frame.size.height / 2);
    } completion:nil];
    
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.logInView.backgroundColor = [UIColor colorWithRed:51.0/255.0 green:70.0/255.0 blue:93.0/255.0 alpha:0.98];
        
        self.logInTF.layer.opacity = 1;
    } completion:nil];
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

- (void)onLogInCancel:(id)sender {
    [self hideKeyboard];
    
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.logInView.backgroundColor = [UIColor colorWithRed:51.0/255.0 green:70.0/255.0 blue:93.0/255.0 alpha:0];
        self.logInTF.center = CGPointMake(self.logInTF.frame.origin.x + self.logInTF.frame.size.width / 2, self.logInTF.frame.origin.y + self.logInTF.frame.size.height / 2  + 80);
        self.logInTF.layer.opacity = 0;
    } completion:^(BOOL finished) {
        [self.logInView removeFromSuperview];
    }];
}

- (void)hideKeyboard {
    [self.view endEditing:YES];
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
