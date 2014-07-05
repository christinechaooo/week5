//
//  HomeViewController.m
//  week5
//
//  Created by Christine Chao on 7/4/14.
//  Copyright (c) 2014 Christine Chao. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@property (nonatomic, strong) UIView *logInView;
@property (nonatomic, strong) UIImageView *logInTF;
@property (nonatomic, strong) UITextField *emailTF;

- (void)onLogIn:(id)sender;
- (void)onLogInCancel:(id)sender;
- (void)hideKeyboard;

@end

@implementation HomeViewController

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
    
    UIImage *header = [UIImage imageNamed:@"homeHeader"];
    UIImageView *headerView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 64)];
    headerView.image = header;
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, 320, 460)];
    UIImage *view = [UIImage imageNamed:@"homeContent"];
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 461)];
    imgView.image = view;
    scrollView.contentSize = imgView.frame.size;
    [scrollView addSubview:imgView];
    
    UIButton *logInButton = [UIButton buttonWithType:UIButtonTypeCustom];
    logInButton.frame = CGRectMake(255, 33, 64, 25);
    [logInButton addTarget:self action:@selector(onLogIn:) forControlEvents:UIControlEventTouchUpInside];
    
    headerView.userInteractionEnabled = YES;
    
    self.logInView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    self.logInView.backgroundColor = [UIColor colorWithRed:19.0/255.0 green:35.0/255.0 blue:57.0/255.0 alpha:0];
    
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
    
    [headerView addSubview:logInButton];
    [self.view addSubview:scrollView];
    [self.view addSubview:headerView];
}

- (void)onLogIn:(id)sender {
    [self.emailTF becomeFirstResponder];
    [self.view addSubview:self.logInView];
    [UIView animateWithDuration:0.6 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.logInTF.center = CGPointMake(10 + self.logInTF.frame.size.width / 2, 109 + self.logInTF.frame.size.height / 2);
    } completion:nil];
    
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.logInView.backgroundColor = [UIColor colorWithRed:19.0/255.0 green:35.0/255.0 blue:57.0/255.0 alpha:0.95];
        
        self.logInTF.layer.opacity = 1;
    } completion:nil];
}

- (void)onLogInCancel:(id)sender {
    [self hideKeyboard];
    
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.logInView.backgroundColor = [UIColor colorWithRed:19.0/255.0 green:35.0/255.0 blue:57.0/255.0 alpha:0];
        self.logInTF.center = CGPointMake(self.logInTF.frame.origin.x + self.logInTF.frame.size.width / 2, self.logInTF.frame.origin.y + self.logInTF.frame.size.height / 2  + 80);
        self.logInTF.layer.opacity = 0;
    } completion:^(BOOL finished) {
        [self.logInView removeFromSuperview];
    }];
}

- (void)hideKeyboard {
    [self.view endEditing:YES];
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
