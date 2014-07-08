//
//  TrendingViewController.h
//  week5
//
//  Created by Christine Chao on 7/4/14.
//  Copyright (c) 2014 Christine Chao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ActivityViewDelegate;

@interface ActivityViewController : UIViewController

@property (nonatomic, weak) id<ActivityViewDelegate> delegate;

@end

@protocol ActivityViewDelegate <NSObject>

-(void)didHitLoginButton;

@end

