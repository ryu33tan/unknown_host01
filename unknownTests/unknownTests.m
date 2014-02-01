//
//  unknownTests.m
//  unknownTests
//
//  Created by Ryusen Sasa on 2014/02/01.
//  Copyright (c) 2014年 Ryusen Sasa. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface unknownTests : XCTestCase

@end

@implementation unknownTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

@end
