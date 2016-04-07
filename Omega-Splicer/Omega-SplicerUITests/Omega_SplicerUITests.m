//
//  Omega_SplicerUITests.m
//  Omega-SplicerUITests
//
//  Created by Charles-Adrien Fournier on 05/04/16.
//  Copyright © 2016 Charles-Adrien Fournier. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface Omega_SplicerUITests : XCTestCase

@end

@implementation Omega_SplicerUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    [super tearDown];
}

- (void)testSettingsView {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.buttons[@"Settings"] tap];
    [app.segmentedControls.buttons[@"Landscape"] tap];
    [app.segmentedControls.buttons[@"m/s"] tap];
    [[[[app.navigationBars[@"Settings"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Back"] elementBoundByIndex:0] tap];
    [app.buttons[@"Settings"] tap];
    
    XCTAssertTrue([app.segmentedControls.buttons[@"Landscape"] isSelected]);
    XCTAssertFalse([app.segmentedControls.buttons[@"Portrait"] isSelected]);

    XCTAssertTrue([app.segmentedControls.buttons[@"m/s"] isSelected]);
    XCTAssertFalse([app.segmentedControls.buttons[@"km/h"] isSelected]);
    XCTAssertFalse([app.segmentedControls.buttons[@"mph"] isSelected]);
    
    [[[[app.navigationBars[@"Settings"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Back"] elementBoundByIndex:0] tap];
}

- (void)testPairView {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.buttons[@"Pair"] tap];
    sleep(5);
    [[[[app.navigationBars[@"Pair"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Back"] elementBoundByIndex:0] tap];
    
}

- (void)testPortraitFlyView {
    XCUIApplication *app = [[XCUIApplication alloc] init];

    [app.buttons[@"Settings"] tap];
    [app.segmentedControls.buttons[@"Portrait"] tap];
    [[[[app.navigationBars[@"Settings"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Back"] elementBoundByIndex:0] tap];
    
    [app.buttons[@"Fly"] tap];
    
    [[[[app.navigationBars[@"Fly"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Back"] elementBoundByIndex:0] tap];
}

- (void)testLandscapeFlyView {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    
    [app.buttons[@"Settings"] tap];
    [app.segmentedControls.buttons[@"Landscape"] tap];
    [[[[app.navigationBars[@"Settings"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Back"] elementBoundByIndex:0] tap];
    
    
    [app.buttons[@"Fly"] tap];
    [[[[app.navigationBars[@"Fly"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Back"] elementBoundByIndex:0] tap];
}

@end
