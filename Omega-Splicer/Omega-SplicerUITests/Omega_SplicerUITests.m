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
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testMainButton {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.buttons[@"Fly"] tap];
    XCUIElement *closeButton = app.buttons[@"Close"];
    [closeButton tap];
    [app.buttons[@"Pair"] tap];
    [closeButton tap];
    [app.buttons[@"Settings"] tap];
    [closeButton tap];
}

@end
