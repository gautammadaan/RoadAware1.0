//
//  DriverData.h
//  ZendriveSDKDemo
//
//  Created by Gautam Madaan on 1/10/15.
//  Copyright (c) 2015 Zendrive. All rights reserved.
//

#ifndef RoadAware1_0_DriverData_h
#define RoadAware1_0_DriverData_h


#endif

#import "MTLModel.h"
#import "MTLJSONAdapter.h"
#import "Score.h"

@interface DriverData : MTLModel <MTLJSONSerializing>
@property (nonatomic) Score *score;
@end