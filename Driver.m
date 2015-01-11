//
//  Driver.m
//  ZendriveSDKDemo
//
//  Created by Gautam Madaan on 1/10/15.
//  Copyright (c) 2015 Zendrive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Driver.h"

@implementation Driver
+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    // model_property_name : json_field_name
    return @{
             };
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionaryValue error:(NSError **)error {
    self = [super initWithDictionary:dictionaryValue error:error];
    if (self == nil) return nil;
    return self;
}

@end