//
// Created by Mac on 22.02.15.
// Copyright (c) 2015 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AddressKey : NSObject <NSCopying>
@property NSString *country;
@property NSString *city;
@property NSString *address;

- (instancetype)initWithCountry:(NSString *)country city:(NSString *)city address:(NSString *)address;

+ (instancetype)keyWithCountry:(NSString *)country city:(NSString *)city address:(NSString *)address;

- (id)copyWithZone:(NSZone *)zone;

- (BOOL)isEqual:(id)other;

- (BOOL)isEqualToKey:(AddressKey *)key;

- (NSUInteger)hash;

@end