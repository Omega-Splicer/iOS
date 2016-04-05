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

@property (strong, nonatomic) OSPlane *examplePlane2;

@property (strong, nonatomic) OSPlane *examplePlane3;

@property (strong, nonatomic) OSPlane *customPlane;

@property (strong, nonatomic) OSPlane *customPlane2;

@property (strong, nonatomic) OSPlane *emptyPlane;

@end

@implementation OSPlaneTests

- (void)setUp {
    [super setUp];

    self.examplePlane = [[OSPlane alloc] init];
    [self.examplePlane planeExample1];

    self.examplePlane2 = [[OSPlane alloc] init];
    [self.examplePlane2 planeExample2];

    self.examplePlane3 = [[OSPlane alloc] init];
    [self.examplePlane3 planeExample3];

    
    self.customPlane = [[OSPlane alloc] init];
    [self.customPlane setName:@"MyCustomPlane"];
    [self.customPlane setBattery:95];
    [self.customPlane setSignal:50];
    [self.customPlane setMotor:25];
    
    self.customPlane2 = [[OSPlane alloc] init];
    [self.customPlane2 updatePlaneWithName:@"CustomPlane" battery:24 signal:90 motor:0];
    [self.customPlane2 setMotor:0];
    
    self.emptyPlane = [[OSPlane alloc] init];
    [self.emptyPlane emptyPlane];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testExamplePlane {
    XCTAssertNotNil(self.examplePlane, @"Example plane is nil");
    XCTAssertEqualObjects(self.examplePlane.name, @"First example plane");
    XCTAssertEqual(self.examplePlane.battery, 100);
    XCTAssertEqual(self.examplePlane.signal, 100);
    XCTAssertEqual(self.examplePlane.motor, 100);
}

- (void)testExamplePlane2 {
    XCTAssertNotNil(self.examplePlane2, @"Example plane 2 is nil");
    XCTAssertEqualObjects(self.examplePlane2.name, @"Second example plane");
    XCTAssertEqual(self.examplePlane2.battery, 50);
    XCTAssertEqual(self.examplePlane2.signal, 50);
    XCTAssertEqual(self.examplePlane2.motor, 50);
}

- (void)testExamplePlane3 {
    XCTAssertNotNil(self.examplePlane3, @"Example plane 3 is nil");
    XCTAssertEqualObjects(self.examplePlane3.name, @"Third example plane");
    XCTAssertEqual(self.examplePlane3.battery, 0);
    XCTAssertEqual(self.examplePlane3.signal, 0);
    XCTAssertEqual(self.examplePlane3.motor, 0);
}

- (void)testCustomPlane {
    XCTAssertNotNil(self.customPlane, @"Custom plane is nil");
    XCTAssertEqualObjects(self.customPlane.name, @"MyCustomPlane");
    XCTAssertEqual(self.customPlane.battery, 95);
    XCTAssertEqual(self.customPlane.signal, 50);
    XCTAssertEqual(self.customPlane.motor, 25);
}

- (void)testCustomPlane2 {
    XCTAssertNotNil(self.customPlane, @"Custom plane is nil");
    XCTAssertEqualObjects(self.customPlane2.name, @"CustomPlane");
    XCTAssertEqual(self.customPlane2.battery, 24);
    XCTAssertEqual(self.customPlane2.signal, 90);
    XCTAssertEqual(self.customPlane2.motor, 0);
}

- (void)testEmptyPlane {
    XCTAssertNotNil(self.emptyPlane, @"Example plane is nil");
    XCTAssertEqualObjects(self.emptyPlane.name, @"");
    XCTAssertEqual(self.emptyPlane.battery, 0);
    XCTAssertEqual(self.emptyPlane.signal, 0);
    XCTAssertEqual(self.emptyPlane.motor, 0);

}

@end
