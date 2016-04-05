//
//  OSHomeViewControllerTests.m
//  Omega-Splicer
//
//  Created by Charles-Adrien Fournier on 04/04/16.
//  Copyright © 2016 Charles-Adrien Fournier. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "OSHomeViewController.h"

@interface OSHomeViewControllerTests : XCTestCase

@property (strong, nonatomic) OSHomeViewController *homeViewController;

@end

@implementation OSHomeViewControllerTests

- (void)setUp {
    [super setUp];
    self.homeViewController = [[OSHomeViewController alloc] init];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testHomeViewController {
    XCTAssertNotNil(self.homeViewController, @"Home view controller is nil");
}

- (void)testStatusBarStyle {
    XCTAssertEqual([self.homeViewController preferredStatusBarStyle], UIStatusBarStyleLightContent);
}

- (void)testMemoryWarning {
    [self.homeViewController didReceiveMemoryWarning];
}

@end
