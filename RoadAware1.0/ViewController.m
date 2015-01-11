//
//  ViewController.m
//  RoadAware1.0
//
//  Created by Gautam Madaan on 1/10/15.
//  Copyright (c) 2015 Gautam Madaan. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    self.lblZenDriveScore = [[UILabel alloc] init];
//    self.lblCautiousScore = [[UILabel alloc] init];
//    self.lblControlScore = [[UILabel alloc] init];
//    self.lblFocusScore = [[UILabel alloc] init];
//    self.lblFuelEfficiency = [[UILabel alloc] init];
//    self.imgView = [[UIImageView alloc] initWithFrame:self.view.bounds];
//    [self.view addSubview: self.imgView];
    
    [self.lblFuelEfficiency.layer setCornerRadius:25];
    [self.lblFocusScore.layer setCornerRadius:25];
    [self.lblControlScore.layer setCornerRadius:25];
    [self.lblCautiousScore.layer setCornerRadius:25];
    [self.lblZenDriveScore.layer setCornerRadius:25];
    [self.lblZenDriveScore.layer setBorderWidth:2];
    [self.lblZenDriveScore.layer setBorderColor:[UIColor whiteColor].CGColor];
    
    [self.lblCautiousScore.layer setBorderWidth:2];
    [self.lblCautiousScore.layer setBorderColor:[UIColor whiteColor].CGColor];
    [self.lblControlScore.layer setBorderWidth:2];
    [self.lblControlScore.layer setBorderColor:[UIColor whiteColor].CGColor];
    [self.lblFocusScore.layer setBorderWidth:2];
    [self.lblFocusScore.layer setBorderColor:[UIColor whiteColor].CGColor];
    [self.lblFuelEfficiency.layer setBorderWidth:2];
    [self.lblFuelEfficiency.layer setBorderColor:[UIColor whiteColor].CGColor];
    
    [self getBMWData];
    [self getZenDriveData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) getBMWData{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:MojioKey forHTTPHeaderField:MojioHead];
    
    [manager GET:baseRestBMWUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"This is response from BMW API : %@", responseObject);
        Driver *data = [MTLJSONAdapter modelOfClass:[Driver class] fromJSONDictionary:responseObject error:nil];
        int fuelEfficiencyScore = ([data.LastFuelEfficiency intValue] + 50);
        
        self.lblFuelEfficiency.text = [NSString stringWithFormat:@"%d", fuelEfficiencyScore];
        NSLog(@"Your BMW fuel efficiency score is %@", self.lblFuelEfficiency.text);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"BMW URL failed to responde : %@", error);
        NSString *errorStr = [error localizedDescription];
        NSInteger errorCode = operation.response.statusCode;
        NSLog(@"Operation.responseData : %@", errorStr);
        NSLog(@"Operation.response.statusCode : %ld", (long)errorCode);
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error Occured" message:[NSString stringWithFormat:@"Sorry, some error. %@", errorStr] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
        
    }];
    
    return;
}



-(void) getZenDriveData{
    AFHTTPRequestOperationManager *manager1 = [AFHTTPRequestOperationManager manager];
    manager1.requestSerializer = [AFJSONRequestSerializer serializer];
//    https://api.zendrive.com/v1/driver/Gautam/score?apikey=VV1ABkw5BsxjbrdazJpQkAJl3gHiyGuT
    NSString *zenURL = [NSString stringWithFormat:@"%@%@score?apikey=%@", zenDriveBaseUrl, driverGautam, appId];
    
    [manager1 GET:zenURL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"This is response from ZenDrive API : %@", responseObject);
        DriverData *driverData = [MTLJSONAdapter modelOfClass:[DriverData class] fromJSONDictionary:responseObject error:nil];
        self.lblFocusScore.text = [NSString stringWithFormat:@"%@",[[driverData valueForKey:@"score"] valueForKey:@"focused_score"]];
        self.lblControlScore.text = [NSString stringWithFormat:@"%@",[[driverData valueForKey:@"score"] valueForKey:@"control_score"]];
        self.lblCautiousScore.text =[NSString stringWithFormat:@"%@", [[driverData valueForKey:@"score"] valueForKey:@"cautious_score"]];
        self.lblZenDriveScore.text = [NSString stringWithFormat:@"%@", [[driverData valueForKey:@"score"] valueForKey:@"zendrive_score"]];
        NSLog(@"Your focus score is %@", self.lblFocusScore.text);
        NSLog(@"Your control score is %@", self.lblControlScore.text);
        NSLog(@"Your cautious score is %@", self.lblCautiousScore.text);
        NSLog(@"Your Total score so far is %@", self.lblZenDriveScore.text);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Zen Drive URL failed to responde : %@", error);
        NSString *errorStr = [error localizedDescription];
        
        NSInteger errorCode = operation.response.statusCode;
        
        NSLog(@"Operation.responseData : %@", errorStr);
        NSLog(@"Operation.response.statusCode : %ld", (long)errorCode);
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error Occured" message:[NSString stringWithFormat:@"Sorry, some error. %@", errorStr] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
        
    }];
    
    return;
}

@end
