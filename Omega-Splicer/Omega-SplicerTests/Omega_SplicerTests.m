//
//  Omega_SplicerTests.m
//  Omega-SplicerTests
//
//  Created by Charles-Adrien Fournier on 09/09/15.
//  Copyright (c) 2015 Charles-Adrien Fournier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "OSHomeViewController.h"
#import "OSPairViewController.h"
#import "OSSettingsViewController.h"
#import "OSFlyLandscapeViewController.h"
#import "OSFlyPortraitViewController.h"

@interface Omega_SplicerTests : XCTestCase

@property (nonatomic, strong) OSHomeViewController *homeVC;

@property (nonatomic, strong) OSPairViewController *pairVC;

@property (nonatomic, strong) OSSettingsViewController *settingsVC;

@property (nonatomic, strong) OSFlyLandscapeViewController *flyLandscapeVC;

@property (nonatomic, strong) OSFlyPortraitViewController *flyPortraitVC;

@end

@implementation Omega_SplicerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    self.homeVC = [[OSHomeViewController alloc] init];
    self.pairVC = [[OSPairViewController alloc] init];
    self.settingsVC = [[OSSettingsViewController alloc] init];
    self.flyLandscapeVC = [[OSFlyLandscapeViewController alloc] init];
    self.flyPortraitVC = [[OSFlyPortraitViewController alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

//- (void)testExample {
//    // This is an example of a functional test case.
//    XCTAssert(YES, @"Pass");
//}

- (void)testHomeView {
    XCTAssertNotNil(self.homeVC, @"Home view controller not nil");
}

- (void)testPairView {
    XCTAssertNotNil(self.pairVC, @"Pair view controller not nil");
}

- (void)testSettingsView {
    XCTAssertNotNil(self.settingsVC, @"Settings view controller not nil");
}

- (void)testFlyLandscapeView {
    XCTAssertNotNil(self.flyLandscapeVC, @"Fly Landscape view controller not nil");
}

- (void)testFlyPortraitView {
    XCTAssertNotNil(self.flyPortraitVC, @"Fly portrait view controller not nil");
}


//- (void)testBad {
//    XCTAssert(NO, @"DON'T PASS");
//}

//- (void)testPerformanceExample {
//    // This is an example of a performance test case.
//    [self measureBlock:^{
//        // Put the code you want to measure the time of here.
//    }];
//}

@end
