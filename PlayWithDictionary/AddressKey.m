//
// Created by Mac on 22.02.15.
// Copyright (c) 2015 Mac. All rights reserved.
//

#import "AddressKey.h"


@implementation AddressKey {

}
- (instancetype)initWithCountry:(NSString *)country city:(NSString *)city address:(NSString *)address {
    self = [super init];
    if (self) {
        self.country = country;
        self.city = city;
        self.address = address;
    }

    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    AddressKey *copy = [[[self class] allocWithZone:zone] init];

    if (copy != nil) {
        copy.country = [self.country copy];
        copy.city = [self.city copy];
        copy.address = [self.address copy];
    }

    return copy;
}

- (BOOL)isEqual:(id)other {
    if (other == self)
        return YES;
    if (!other || ![[other class] isEqual:[self class]])
        return NO;

    return [self isEqualToKey:other];
}

- (BOOL)isEqualToKey:(AddressKey *)key {
    if (self == key)
        return YES;
    if (key == nil)
        return NO;
    if (self.country != key.country && ![self.country isEqualToString:key.country])
        return NO;
    if (self.city != key.city && ![self.city isEqualToString:key.city])
        return NO;
    if (self.address != key.address && ![self.address isEqualToString:key.address])
        return NO;
    return YES;
}

- (NSUInteger)hash {
    NSUInteger hash = [self.country hash];
    hash = hash * 31u + [self.city hash];
    hash = hash * 31u + [self.address hash];
    return hash;
}


+ (instancetype)keyWithCountry:(NSString *)country city:(NSString *)city address:(NSString *)address {
    return [[self alloc] initWithCountry:country city:city address:address];
}

@end