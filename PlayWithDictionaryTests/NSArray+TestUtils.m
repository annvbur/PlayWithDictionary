//
// Created by Mac on 25.01.15.
// Copyright (c) 2015 Mac. All rights reserved.
//

#import "NSArray+TestUtils.h"



@implementation NSArray (TestUtils)

+ (NSArray *)loadTestListByName:(NSString *)listName clazz:(Class)clazz {
    NSBundle *bundle = [NSBundle bundleForClass:clazz];
    NSString *path = [bundle pathForResource:listName ofType:@"plist"];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSArray *borsch = [NSArray arrayWithContentsOfURL:url];
    return borsch;
}

-(void) logArray{
    NSString *arrayAsString = [self componentsJoinedByString:@"\n"];
    NSLog(@"Array, count:%d [\n%@]\n", self.count, arrayAsString);
}

//- (NSArray *)arrayByRemovingDuplications{
//   // [resultArray arrayByAddingObjectsFromArray:[[NSSet setWithArray:resultArray] allObjects]];
//    NSArray * resultArray = [[NSSet setWithArray:self] allObjects];
//    return resultArray;
//}

- (NSArray *)arrayByRemovingDuplications{
    NSMutableArray *resultArray = [NSMutableArray arrayWithCapacity:[self count]];
    for (id item in self)
        if (![resultArray containsObject:item])
            [resultArray addObject:item];
    return resultArray;


}

-(int)countOfObjectOccurrences:(id)object{
    int occurrences = 0;
    for (id item in self)
        occurrences += [item isEqual:object];

    //if ([item isEqual:object]);
    return occurrences;

}




@end