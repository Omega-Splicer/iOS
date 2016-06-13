//
//  OSFlyLandscapeViewControllerTests.m
//  Omega-Splicer
//
//  Created by Charles-Adrien Fournier on 04/04/16.
//  Copyright © 2016 Charles-Adrien Fournier. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "OSFlyLandscapeViewController.h"

@interface OSFlyLandscapeViewControllerTests : XCTestCase

@property (strong, nonatomic) OSFlyLandscapeViewController *flyLandscapeViewController;

@end

@implementation OSFlyLandscapeViewControllerTests

- (void)setUp {
    [super setUp];
    self.flyLandscapeViewController = [[OSFlyLandscapeViewController alloc] init];
    [self.flyLandscapeViewController displayJoystick];
    [self.flyLandscapeViewController removeJoystick];
    [self.flyLandscapeViewController joystick:nil didUpdate:CGPointMake(10, 10)];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testFlyLandscapeViewController {
    XCTAssertNotNil(self.flyLandscapeViewController, @"Fly landscape view controller is nil");
}

- (void)testMemoryWarning {
    [self.flyLandscapeViewController didReceiveMemoryWarning];
}


@end
