//
//  Driver.h
//  ZendriveSDKDemo
//
//  Created by Gautam Madaan on 1/10/15.
//  Copyright (c) 2015 Zendrive. All rights reserved.
//

#ifndef RoadAware1_0_Driver_h
#define RoadAware1_0_Driver_h


#endif

#import "MTLModel.h"
#import "MTLJSONAdapter.h"

@interface Driver : MTLModel <MTLJSONSerializing>
@property (nonatomic) NSString *LastFuelEfficiency;
@end