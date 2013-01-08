//
//  ResumeSecondViewController.h
//  Resume
//
//  Created by Vishal Sunak on 1/2/13.
//  Copyright (c) 2013 Vishal Sunak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResumeSecondViewController : UIViewController

@property (strong, nonatomic) NSDictionary *facebookDict;


@property (strong, nonatomic) NSArray *facebook;

@property (strong, nonatomic) IBOutlet UILabel *neuLabel;

@property (strong, nonatomic) IBOutlet UILabel *neuClass;

@property (strong, nonatomic) IBOutlet UILabel *sysEng;

@property (strong, nonatomic) IBOutlet UILabel *wpiClass;

@end
