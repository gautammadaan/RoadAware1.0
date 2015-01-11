//
//  Score.h
//  ZendriveSDKDemo
//
//  Created by Gautam Madaan on 1/10/15.
//  Copyright (c) 2015 Zendrive. All rights reserved.
//

#ifndef RoadAware1_0_Score_h
#define RoadAware1_0_Score_h


#endif

#import "MTLModel.h"
#import "MTLJSONAdapter.h"

@interface Score: MTLModel <MTLJSONSerializing>
@property (nonatomic) NSString *zendrive_score;
@property (nonatomic) NSString *control_score;
@property (nonatomic) NSString *cautious_score;
@property (nonatomic) NSString *focused_score;

@end