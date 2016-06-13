//
//  OSJoystickTests.m
//  Omega-Splicer
//
//  Created by Charles Fournier on 06/06/16.
//  Copyright © 2016 Charles-Adrien Fournier. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "OSJoystick.h"

@interface OSJoystickTests : XCTestCase

@property (strong, nonatomic) OSJoystick *joystick1;

@end

@implementation OSJoystickTests

- (void)setUp {
    [super setUp];
    
    self.joystick1 = [[OSJoystick alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [self.joystick1 setMovementUpdateInterval:-78];
    [self.joystick1 setMovementUpdateInterval:2];
    [self.joystick1 setMoveViscosity:2 andSmallestValue:10];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testJoystick {
    XCTAssertNotNil(self.joystick1);
}

@end
