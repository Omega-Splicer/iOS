//
//  OSSettingsViewControllerTests.m
//  Omega-Splicer
//
//  Created by Charles-Adrien Fournier on 04/04/16.
//  Copyright © 2016 Charles-Adrien Fournier. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "OSSettingsViewController.h"

@interface OSSettingsViewControllerTests : XCTestCase

@property (strong, nonatomic) OSSettingsViewController *settingsViewController;

@end

@implementation OSSettingsViewControllerTests

- (void)setUp {
    [super setUp];
    self.settingsViewController = [[OSSettingsViewController alloc] init];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testSettingsViewController {
    XCTAssertNotNil(self.settingsViewController, @"Setting view controller is nil");
}

- (void)testMemoryWarning {
    [self.settingsViewController didReceiveMemoryWarning];
}

- (void)testStatusBarStyle {
    XCTAssertEqual([self.settingsViewController preferredStatusBarStyle], UIStatusBarStyleLightContent);
}


@end
