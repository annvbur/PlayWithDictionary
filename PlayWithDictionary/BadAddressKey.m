//
// Created by Mac on 22.02.15.
// Copyright (c) 2015 Mac. All rights reserved.
//

#import "BadAddressKey.h"


@implementation BadAddressKey {

}


- (NSUInteger)hash {
//    NSUInteger hash = [self.country length];
//    hash += [self.city length];
//    hash += [self.address length];

//    NSUInteger hash= [self.country characterAtIndex:0] *[self.city characterAtIndex:0] * [self.address characterAtIndex:0];

    NSUInteger hash = [self.country length];
    hash += [self.city length];
    hash *= [self.address length];
    return hash;
}
@end