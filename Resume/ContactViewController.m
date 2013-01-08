//
//  ContactViewController.m
//  Resume
//
//  Created by Vishal Sunak on 1/3/13.
//  Copyright (c) 2013 Vishal Sunak. All rights reserved.
//

#import "ContactViewController.h"

@interface ContactViewController ()

@end

@implementation ContactViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
    [self.followTwitterButton addTarget:self action:@selector(followTwitter) forControlEvents:UIControlEventTouchUpInside];
    [self.followTwitterButton setTitle:@"Follow Me on Twitter" forState:UIControlStateNormal];
    
    [self.emailButton addTarget:self action:@selector(launchMailAppOnDevice) forControlEvents:UIControlEventTouchUpInside];
    [self.emailButton setTitle:@"Email Me" forState:UIControlStateNormal];
    
    [self.callButton addTarget:self action:@selector(callMe) forControlEvents:UIControlEventTouchUpInside];
    [self.callButton setTitle:@"Call Me" forState:UIControlStateNormal];
    
    [self.aboutButton addTarget:self action:@selector(aboutMe) forControlEvents:UIControlEventTouchUpInside];
    [self.aboutButton setTitle:@"About Me" forState:UIControlStateNormal];
    
}

-(void) followTwitter
{
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.twitter.com/theSunak"]];
}

-(void) callMe
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:6034599105"]];
}

-(void) aboutMe
{
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://www.about.me/vishalsunak"]];
}

-(void)launchMailAppOnDevice
{
    NSString *recipients = @"mailto:vishalsunak@gmail.com";
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:recipients]];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
