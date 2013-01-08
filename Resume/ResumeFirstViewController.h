//
//  ResumeFirstViewController.h
//  Resume
//
//  Created by Vishal Sunak on 1/2/13.
//  Copyright (c) 2013 Vishal Sunak. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ResumeFirstViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *profilePic;

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;


@property (strong, nonatomic) NSDictionary *facebookDict;

@property (strong, nonatomic) NSArray *facebook;

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;

@property (strong, nonatomic) IBOutlet UILabel *liveIn;

@property (strong, nonatomic) IBOutlet UILabel *hometown;

@property (strong, nonatomic) IBOutlet UITextView *bio;

@end
