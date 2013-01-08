//
//  ResumeSecondViewController.m
//  Resume
//
//  Created by Vishal Sunak on 1/2/13.
//  Copyright (c) 2013 Vishal Sunak. All rights reserved.
//

#import "ResumeSecondViewController.h"


//This allows us get picture from internet using AFNetworking:
#import "UIImageView+AFNetworking.h"

//This allows us to get JSON data from internet:
#import "AFJSONRequestOperation.h"

@interface ResumeSecondViewController ()

@end

@implementation ResumeSecondViewController

//@synthesize profilePic;
//@synthesize liveIn;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];    
    
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
    
    //----------------Northeastern Stuff--------------------

    NSString *compEng = [[[self.facebookDict objectForKey:@"education"][1] objectForKey:@"concentration"][0] objectForKey:@"name"] ;
    
     self.neuLabel.text = [NSString stringWithFormat:@"B.S in %@", compEng];
    
    NSString *neuClass = [[[self.facebookDict objectForKey:@"education"][1] objectForKey:@"year"]objectForKey:@"name"] ;
    
    self.neuClass.text = [NSString stringWithFormat:@"Class of %@", neuClass];
   //----------------Northeastern Stuff--------------------
    
    //----------------WPI Stuff--------------------
    NSString *sysEng = [[[self.facebookDict objectForKey:@"education"][2] objectForKey:@"degree"]objectForKey:@"name"] ;
    
    self.sysEng.text = sysEng;
    
    //Search the Dictionary for the hometown and pull it:
    NSString *wpiClass = [[[self.facebookDict objectForKey:@"education"][2] objectForKey:@"year"]objectForKey:@"name"] ;
    
    self.wpiClass.text = [NSString stringWithFormat:@"Class of %@", wpiClass];
    //----------------WPI Stuff--------------------

    
    //----------------BSS Stuff--------------------
    
    
    
    
    
    
    

    //----------------BSS Stuff--------------------

}



@end
