//
//  CreateViewController.m
//  week5
//
//  Created by Christine Chao on 7/4/14.
//  Copyright (c) 2014 Christine Chao. All rights reserved.
//

#import "CreateViewController.h"
#import "TabBarViewController.h"

@interface CreateViewController ()

@property(nonatomic, strong) UIView *backgroundRect;
@property(nonatomic, strong) UIButton *dismissButton;

- (void)onDismiss:(id)sender;
- (void)transitionIn;
- (void)transitionOut;

@end

@implementation CreateViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //[self.view setBackgroundColor:[UIColor colorWithRed:51.0/255.0 green:70.0/255.0 blue:93.0/255.0 alpha:1]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.backgroundRect = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    self.backgroundRect.backgroundColor = [UIColor colorWithRed:51.0/255.0 green:70.0/255.0 blue:93.0/255.0 alpha:1];
    self.backgroundRect.layer.opacity = 0;
    
    UILabel *dismissLabel = [[UILabel alloc] initWithFrame:CGRectMake(110, 5, 100, 44)];
    dismissLabel.text = @"Nevermind";
    dismissLabel.textColor = [UIColor colorWithRed:133.0/255.0 green:141.0/255.0 blue:152.0/255.0 alpha:1];
    dismissLabel.textAlignment = NSTextAlignmentCenter;
    
    self.dismissButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.dismissButton.frame = CGRectMake(0, 568, 320, 55);
    self.dismissButton.backgroundColor = [UIColor colorWithRed:60.0/255.0 green:77.0/255.0 blue:96.0/255.0 alpha:1];
    [self.dismissButton addTarget:self action:@selector(onDismiss:) forControlEvents:UIControlEventTouchUpInside];
    
    [self transitionIn];
    
    [self.dismissButton addSubview:dismissLabel];
    [self.view addSubview:self.backgroundRect];
    
    NSArray *imageNames = [NSArray arrayWithObjects:@"icon", @"icon2",@"icon3", @"icon4", @"icon5", @"icon6", nil];
    
    NSArray *imageLabels = [NSArray arrayWithObjects:@"Text", @"Photo",@"Quote", @"Link", @"Chat", @"Video", nil];
    
    for (int i = 0; i < imageNames.count / 3; i++) {
        for (int j = 0; j < imageNames.count / 2; j++) {
            NSLog(@"%d, %d, %d",i, j, j + i * 3);
            UIImage *iconImg = [UIImage imageNamed:imageNames[j + i * 3]];
            UIImageView *iconView = [[UIImageView alloc] initWithFrame:CGRectMake(24 + j * (iconImg.size.width + 24), 161 + i * (iconImg.size.height + 48), iconImg.size.width, iconImg.size.height)];
            iconView.image = iconImg;
            
            UILabel *iconLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, iconImg.size.height + 3, iconImg.size.width, 22)];
            iconLabel.text = imageLabels[j + i * 3];
            iconLabel.font = [UIFont systemFontOfSize:14];
            iconLabel.textAlignment = NSTextAlignmentCenter;
            iconLabel.textColor = [UIColor whiteColor];
            [iconView addSubview:iconLabel];
            [self.view addSubview:iconView];
        }
    }
    
    [self.view addSubview:self.dismissButton];
}

- (void)transitionIn {
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.backgroundRect.layer.opacity = 0.98;
        self.dismissButton.center = CGPointMake(self.dismissButton.frame.size.width / 2, 513 + self.dismissButton.frame.size.height / 2);
    } completion:nil];
}

- (void)transitionOut {
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.backgroundRect.layer.opacity = 0;
        self.dismissButton.center = CGPointMake(self.dismissButton.frame.size.width / 2, 568 + self.dismissButton.frame.size.height / 2);
    } completion:^(BOOL finished) {
        [self.view removeFromSuperview];
    }];
    
}

- (void)onDismiss:(id)sender {
    NSLog(@"dismiss");
    [self transitionOut];
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
