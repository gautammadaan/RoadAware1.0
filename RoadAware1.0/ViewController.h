//
//  ViewController.h
//  RoadAware1.0
//
//  Created by Gautam Madaan on 1/10/15.
//  Copyright (c) 2015 Gautam Madaan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
#import "DriverData.h"
#import "Score.h"
#import "Driver.h"

@interface ViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *lblFuelEfficiency;
@property (nonatomic, strong) IBOutlet UILabel *lblZenDriveScore;
@property (nonatomic, strong) IBOutlet UILabel *lblCautiousScore;
@property (nonatomic, strong) IBOutlet UILabel *lblFocusScore;
@property (nonatomic, strong) IBOutlet UILabel *lblControlScore;
//@property (nonatomic, strong) UIImageView *imgView;

@end

