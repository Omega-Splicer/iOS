//
//  OSPlaneTest.m
//  Omega-Splicer
//
//  Created by Charles-Adrien Fournier on 04/04/16.
//  Copyright © 2016 Charles-Adrien Fournier. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "OSPlane.h"

@interface OSPlaneTests : XCTestCase

@property (strong, nonatomic) OSPlane *examplePlane;

@property (strong, nonatomic) OSPlane *customPlane;

@end

@implementation OSPlaneTests

- (void)setUp {
    [super setUp];

    self.examplePlane = [[OSPlane alloc] init];
    [self.examplePlane planeExample1];
    
    self.customPlane = [[OSPlane alloc] init];
    [self.customPlane setName:@"MyCustomPlane"];
    [self.customPlane setBattery:95];
    [self.customPlane setSignal:50];
    [self.customPlane setMotor:25];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExamplePlane {
    XCTAssertNotNil(self.examplePlane, @"Example plane is nil");
    XCTAssertEqualObjects(self.examplePlane.name, @"First example plane");
    XCTAssertEqual(self.examplePlane.battery, 100);
    XCTAssertEqual(self.examplePlane.signal, 100);
    XCTAssertEqual(self.examplePlane.motor, 100);
}

- (void)testCustomPlane {
    XCTAssertNotNil(self.customPlane, @"Custom plane is nil");
    XCTAssertEqualObjects(self.customPlane.name, @"MyCustomPlane");
    XCTAssertEqual(self.customPlane.battery, 95);
    XCTAssertEqual(self.customPlane.signal, 50);
    XCTAssertEqual(self.customPlane.motor, 25);
}

@end
