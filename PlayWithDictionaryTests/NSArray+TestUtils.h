//
// Created by Mac on 25.01.15.
// Copyright (c) 2015 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (TestUtils)
+ (NSArray *)loadTestListByName:(NSString *)listName clazz:(Class)clazz;

- (void)logArray;

- (NSArray *)arrayByRemovingDuplications;

-(int)countOfObjectOccurrences:(id)object;
@end