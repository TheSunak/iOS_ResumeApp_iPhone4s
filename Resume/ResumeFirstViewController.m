//
//  ResumeFirstViewController.m
//  Resume
//
//  Created by Vishal Sunak on 1/2/13.
//  Copyright (c) 2013 Vishal Sunak. All rights reserved.
//

#import "ResumeFirstViewController.h"

//This allows us get picture from internet using AFNetworking:
#import "UIImageView+AFNetworking.h"

//This allows us to get JSON data from internet:
#import "AFJSONRequestOperation.h"


@interface ResumeFirstViewController ()

@end

@implementation ResumeFirstViewController

@synthesize profilePic;
@synthesize liveIn;


- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.profilePic setImageWithURL:[NSURL URLWithString:@"http://sphotos-a.xx.fbcdn.net/hphotos-ash4/281497_10100703106845059_1761265290_n.jpg"]
                     placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    
    
    //Twitter URL: http://a0.twimg.com/profile_images/3022129881/65bac3f530ef5f215d28584201639997.jpeg
    

    
    //Add to the Scrollview
    [self.scrollView addSubview:self.profilePic];


    //----------------PULLING JSON DATA OFF THE INTERNET USING AFNETWORKING------
    
    //Create an NSURL set to our endpoint:
    NSURL *url = [[NSURL alloc] initWithString:@"https://graph.facebook.com/1809586?access_token=AAAFR2fhXjV4BACva49QsrM1W3ynPFOYOrGk8Aft5xbmE4OIiHojN3cGDA7KemCn2XvL61ZC6ZCQlAV8cZAK26jh1YUK6oYZD"];
    
    //Long lasting token: AAAFR2fhXjV4BACva49QsrM1W3ynPFOYOrGk8Aft5xbmE4OIiHojN3cGDA7KemCn2XvL61ZC6ZCQlAV8cZAK26jh1YUK6oYZD&expires=5184000
    
    //Create an NSURLRequest with our NSURL
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    //Create a AFJSONRequestOperation which will do the call to the internet
    
    
    //In order to do the ASYNCH operation, using the "^" means its a block
    //Blocks will allow me to do the ASYNCH operation in Obj-C
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation
                                         JSONRequestOperationWithRequest:request
                                         success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON){
                                             //Store the return JSON data into the userProfile NSDictionary:
                                             
                                             //This command below returns an NSArray:
                                             self.facebook = JSON;
                                             
                                             //NSLog(@"%@", [JSON objectForKey:@"results"]);
                                             //self.userProfile = [JSON objectForKey:@"results"];
                                             [self requestSuccessful];
                                             
                                             
                                         }
                                         
                                         failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON)
                                         {
                                             NSLog(@"NSError: %@",error.localizedDescription);
                                         }];
    
    [operation start];

    
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) requestSuccessful
{
    //Cast the Array to a NSDictionary
    self.facebookDict = (NSDictionary *)self.facebook;
    
    //Search the Dictionary for the hometown and pull it:
    NSString *name = [self.facebookDict objectForKey:@"name"];
    NSString *currentTown = [[self.facebookDict objectForKey:@"location"] objectForKey:@"name"];
    NSString *hometown = [[self.facebookDict objectForKey:@"hometown"] objectForKey:@"name"];
    NSString *bio = [self.facebookDict objectForKey:@"bio"];
    
    self.nameLabel.text = name;
    self.liveIn.text = [NSString stringWithFormat:@"Lives In: %@", currentTown];
    self.hometown.text = [NSString stringWithFormat:@"Hometown: %@", hometown];
    
    self.bio.text = [NSString stringWithFormat:@"Bio: %@", bio];
    self.bio.editable = NO;
    
    
    [self.scrollView addSubview:self.liveIn];
    
    [self.view addSubview:self.scrollView];
    
    
    
    
}


@end
