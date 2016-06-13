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
    [app.segmentedControls.buttons[@"Gyroscope"] tap];
    [[[[app.navigationBars[@"Settings"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Back"] elementBoundByIndex:0] tap];
    [app.buttons[@"Settings"] tap];
    
    XCTAssertTrue([app.segmentedControls.buttons[@"Landscape"] isSelected]);
    XCTAssertFalse([app.segmentedControls.buttons[@"Portrait"] isSelected]);

    XCTAssertTrue([app.segmentedControls.buttons[@"m/s"] isSelected]);
    XCTAssertFalse([app.segmentedControls.buttons[@"km/h"] isSelected]);
    XCTAssertFalse([app.segmentedControls.buttons[@"mph"] isSelected]);
    
    XCTAssertTrue([app.segmentedControls.buttons[@"Gyroscope"] isSelected]);
    XCTAssertFalse([app.segmentedControls.buttons[@"Joystick"] isSelected]);
    
    [app.segmentedControls.buttons[@"Joystick"] tap];
    [app.segmentedControls.buttons[@"km/h"] tap];
    
    [[[[app.navigationBars[@"Settings"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Back"] elementBoundByIndex:0] tap];
}

//- (void)testPairView {
//    XCUIApplication *app = [[XCUIApplication alloc] init];
//    [app.buttons[@"Pair"] tap];
//    sleep(5);
//    [[[[app.navigationBars[@"Pair"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Back"] elementBoundByIndex:0] tap];
//}

//- (void)testExample {

//    XCUIApplication *app = [[XCUIApplication alloc] init];
//    [app.buttons[@"Fly"] tap];
//    [[[[[[[app.otherElements containingType:XCUIElementTypeNavigationBar identifier:@"Fly"] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther] elementBoundByIndex:1].images[@"joy_thumb"] tap];
//    [[[[app.navigationBars[@"Fly"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Back"] elementBoundByIndex:0] tap];
//    [app.buttons[@"Pair"] tap];
//    [[[[app.navigationBars[@"Pair"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Back"] elementBoundByIndex:0] tap];
    
//}

- (void)testPortraitFlyView {
    XCUIApplication *app = [[XCUIApplication alloc] init];

    [app.buttons[@"Settings"] tap];
    [app.segmentedControls.buttons[@"Portrait"] tap];
    [[[[app.navigationBars[@"Settings"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Back"] elementBoundByIndex:0] tap];
    
    [app.buttons[@"Fly"] tap];
    
//    [[[XCUIApplication alloc] init].scrollViews.otherElements.icons[@"Omega-Splicer"] swipeUp];
    
    [app.staticTexts[@"50%"] swipeLeft];
    [app.staticTexts[@"23%"] swipeRight];
    
    
    [[[[app.navigationBars[@"Fly"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Back"] elementBoundByIndex:0] tap];
}

- (void)testLandscapeFlyView {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    
    [app.buttons[@"Settings"] tap];
    [app.segmentedControls.buttons[@"Landscape"] tap];
    [[[[app.navigationBars[@"Settings"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Back"] elementBoundByIndex:0] tap];
    
    [app.buttons[@"Fly"] tap];
    
    XCUIElement *element = [[[[[[XCUIApplication alloc] init].otherElements containingType:XCUIElementTypeNavigationBar identifier:@"Fly"] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element;
    
    [[[element childrenMatchingType:XCUIElementTypeAny] elementMatchingType:XCUIElementTypeAny identifier:@"rightJoystickView"] doubleTap];
    [[[element childrenMatchingType:XCUIElementTypeAny] elementMatchingType:XCUIElementTypeAny identifier:@"rightJoystickView"] tap];

    
    XCUIElement *leftjoystickviewElement = app.otherElements[@"leftJoystickVIew"];
    [leftjoystickviewElement swipeRight];
    
    [[[[app.navigationBars[@"Fly"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Back"] elementBoundByIndex:0] tap];
}

@end
