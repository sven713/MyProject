//
//  testTests.m
//  testTests
//
//  Created by sven on 16/10/26.
//  Copyright © 2016年 sven. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TextBlurViewController.h"

@interface testTests : XCTestCase

@end

@implementation testTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
//    TextBlurViewController *vc = [TextBlurViewController new];
//    
//    // Given
//    NSInteger number1 = 1; NSInteger number2 = 2;
//    // when
//    NSInteger result = [vc addNumber:number1 number2:number2];
//    
//    // Then
//    XCTAssertEqual(result, 3);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
