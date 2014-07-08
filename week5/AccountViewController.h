//
//  AccountViewController.h
//  week5
//
//  Created by Christine Chao on 7/4/14.
//  Copyright (c) 2014 Christine Chao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AccountViewDelegate;

@interface AccountViewController : UIViewController

@property (nonatomic, weak) id<AccountViewDelegate> delegate;

@end

@protocol AccountViewDelegate <NSObject>

-(void)didHitLoginButton;

@end
