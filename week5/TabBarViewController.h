//
//  TabBarViewController.h
//  week5
//
//  Created by Christine Chao on 7/3/14.
//  Copyright (c) 2014 Christine Chao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewController.h"
#import "AccountViewController.h"
#import "ActivityViewController.h"
#import "CreateViewController.h"

@interface TabBarViewController : UIViewController <HomeViewDelegate, AccountViewDelegate, ActivityViewDelegate, CreateViewDelegate>

@end
