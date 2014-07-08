//
//  CreateViewController.h
//  week5
//
//  Created by Christine Chao on 7/4/14.
//  Copyright (c) 2014 Christine Chao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CreateViewDelegate;

@interface CreateViewController : UIViewController

@property (nonatomic, weak) id<CreateViewDelegate> delegate;

@end

@protocol CreateViewDelegate <NSObject>

- (void)resumeTooltip;

@end



