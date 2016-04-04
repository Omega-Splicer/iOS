//
//  Omega_SplicerTests.m
//  Omega-SplicerTests
//
//  Created by Charles-Adrien Fournier on 09/09/15.
//  Copyright (c) 2015 Charles-Adrien Fournier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

// Controller
#import "OSHomeViewController.h"
#import "OSPairViewController.h"
#import "OSSettingsViewController.h"
#import "OSFlyLandscapeViewController.h"
#import "OSFlyPortraitViewController.h"

// Model
#import "OSPlane.h"

@interface Omega_SplicerTests : XCTestCase

@property (nonatomic, strong) OSHomeViewController *homeVC;

@property (nonatomic, strong) OSPairViewController *pairVC;

@property (nonatomic, strong) OSSettingsViewController *settingsVC;

@property (nonatomic, strong) OSFlyLandscapeViewController *flyLandscapeVC;

@property (nonatomic, strong) OSFlyPortraitViewController *flyPortraitVC;

@property (nonatomic, strong) OSPlane *plane;

@end

@implementation Omega_SplicerTests

- (void)setUp {
    [super setUp];
    
    // Controller set up
    self.homeVC = [[OSHomeViewController alloc] init];
    self.pairVC = [[OSPairViewController alloc] init];
    self.settingsVC = [[OSSettingsViewController alloc] init];
    self.flyLandscapeVC = [[OSFlyLandscapeViewController alloc] init];
    self.flyPortraitVC = [[OSFlyPortraitViewController alloc] init];

    // Model set up
    self.plane = [[OSPlane alloc] init];
    [self.plane initEmptyPlane];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

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

- (void)testPlaneModel {
    XCTAssertEqualObjects([self.plane name], @"Empty plane");
    XCTAssertEqual([self.plane battery], 0);
    XCTAssertEqual([self.plane signal], 0);
    XCTAssertEqual([self.plane motor], 0);
}

@end
