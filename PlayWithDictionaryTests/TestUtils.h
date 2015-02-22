//
// Created by Mac on 01.02.15.
// Copyright (c) 2015 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TestUtils : NSObject
+ (NSMutableArray *)loadRawDataArray;

+ (void)performBlock:(void (^)())pFunction nTimes:(int)times;
@end