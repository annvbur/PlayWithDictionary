//
//  PlayWithDictionaryTests.m
//  PlayWithDictionaryTests
//
//  Created by Mac on 01.02.15.
//  Copyright (c) 2015 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "TestUtils.h"
#import "UserInfo.h"
#import "AddressKey.h"
#import "BadAddressKey.h"
#import "NSArray+TestUtils.h"

static NSString *const TARGET_BITCOIN_ID = @"1C14TpbkGWeLQazm84JhX2yjBA4fbAN4E9";

@interface PlayWithDictionaryTests : XCTestCase

@end

@implementation PlayWithDictionaryTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
//
//    NSArray *rawData = [TestUtils loadRawDataArray];
//    NSMutableArray *preparedArray = [[NSMutableArray alloc] initWithCapacity:rawData.count];    //для того чтоб он взял памяти столько сколько нужно - не мало
//
//    for(NSDictionary *dict in rawData){
//        UserInfo *user = [UserInfo infoWithDictionary:dict];  //фабричный метод
//        [preparedArray addObject:user];
//
//
//    }

}

- (void)testPerformance_searchInArray {
    [self measureMetrics:[[self class] defaultPerformanceMetrics] automaticallyStartMeasuring:NO forBlock:^{
        NSMutableArray *preparedArray = [self buildPreparedArray];  //загрузили массив

        [self startMeasuring];
        __block  UserInfo *targetObject;

        [TestUtils performBlock:^() {
            // производим наш поиск
            int targetIndex;
            targetIndex = [preparedArray indexOfObjectPassingTest:^BOOL(UserInfo *obj, NSUInteger idx, BOOL *stop) {

                return [obj.bitcoin isEqualToString:TARGET_BITCOIN_ID];
            }];


            UserInfo *targetObject;        //нашла ли мы что-то
            if (targetIndex != NSNotFound) {
                targetObject = preparedArray[targetIndex];
            }                                                  //вытащили по индексу наш элемент

        }                nTimes:1];


        [self stopMeasuring];    //остановили и выводим в лог элемент
        NSLog(@"%@", targetObject);

        // Do teardown work that needs to be done for every iteration but you don't want to measure after the call to -stopMeasuring

    }];
}

- (NSMutableArray *)buildPreparedArray {
    NSArray *rawData = [TestUtils loadRawDataArray];
    NSMutableArray *preparedArray = [[NSMutableArray alloc] initWithCapacity:rawData.count];    //для того чтоб он взял памяти столько сколько нужно - не мало

    // загружаем наш массив
    for (NSDictionary *dict in rawData) {
        UserInfo *user = [UserInfo infoWithDictionary:dict];  //фабричный метод
        [preparedArray addObject:user];
    }
    return preparedArray;
}

- (void)testPerformance_searchInDictionary {
    [self measureMetrics:[[self class] defaultPerformanceMetrics] automaticallyStartMeasuring:NO forBlock:^{

        NSDictionary *preparedDictionary = [self buildPreparedDictionary];     //measureMetrics о умолчанию выполняет поиск 10 раз

        [self startMeasuring];
        __block  UserInfo *targetObject;

        [TestUtils performBlock:^() {
            //{"country":"Indonesia","city":"Jembangan","address":"729 Roth Hill"
            BadAddressKey *key = [BadAddressKey keyWithCountry:@"Indonesia" city:@"Jembangan" address:@"729 Roth Hill"];
            targetObject = preparedDictionary[key];
            XCTAssertNotNil(targetObject);

        }                nTimes:1];


        [self stopMeasuring];
        NSLog(@"%@", targetObject);


    }];


}

- (NSDictionary *)buildPreparedDictionary {
    NSArray *rawData = [TestUtils loadRawDataArray];
    NSMutableDictionary *result = [[NSMutableDictionary alloc] initWithCapacity:rawData.count];

    for (NSDictionary *dict in rawData) {
        UserInfo *info = [UserInfo infoWithDictionary:dict];

        BadAddressKey *key = [BadAddressKey keyWithCountry:info.country city:info.city address:info.address];
        result[key] = info;

    }
    return result;
}

- (void)testFilteringArray {

    NSMutableArray *preparedArray = [self buildPreparedArray];// загрузили все мок данные
//    NSArray *countries = [NSArray loadTestListByName:@"Countries_SA" clazz:[self class]];
    NSArray *array = [NSArray loadTestListByName:@"Countries_SA" clazz:[self class]];
    NSArray *countries = [NSSet setWithArray:array];
    [self measureMetrics:[[self class] defaultPerformanceMetrics] automaticallyStartMeasuring:NO forBlock:^{

        __block NSMutableArray *result;
        [self startMeasuring];
        [TestUtils performBlock:^() {






            result = [NSMutableArray array];
        for (UserInfo *info in preparedArray) {
            if ([countries containsObject:info.country]) {
                [result addObject:info];
            }
        }


        }                nTimes:100];
        [self stopMeasuring];
        NSLog(@"found users count: %d", result.count);
    }];
}
@end

