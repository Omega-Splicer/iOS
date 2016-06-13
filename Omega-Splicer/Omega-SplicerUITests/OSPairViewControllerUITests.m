//
//  OSPairViewControllerUITests.m
//  Omega-Splicer
//
//  Created by Charles Fournier on 06/06/16.
//  Copyright © 2016 Charles-Adrien Fournier. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface OSPairViewControllerUITests : XCTestCase

@end

@implementation OSPairViewControllerUITests

- (void)setUp {
    [super setUp];
    self.continueAfterFailure = NO;
    [[[XCUIApplication alloc] init] launch];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testPairView {
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.buttons[@"Pair"] tap];
    
    
#if (TARGET_OS_SIMULATOR) // Simulator
    
    XCUIElement *okButton = app.alerts[@"Omega-Splicer requires Bluetooth"].collectionViews.buttons[@"OK"];
    [okButton tap];
    
#endif
    
#if !(TARGET_OS_SIMULATOR) // iOS Device
    sleep(2);
    [[[[app.navigationBars[@"OSPairTableView"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Back"] elementBoundByIndex:0] tap];
    
#endif
    
}

@end
