//
//  HomeViewController.h
//  week5
//
//  Created by Christine Chao on 7/4/14.
//  Copyright (c) 2014 Christine Chao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HomeViewDelegate;

@interface HomeViewController : UIViewController

@property (nonatomic, weak) id<HomeViewDelegate> delegate;

@end

@protocol HomeViewDelegate <NSObject>

- (void)didHitLoginButton;
- (void)pauseTooltip;
- (void)resumeTooltip;

@end
