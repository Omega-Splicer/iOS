//
//  OSFlyPortraitViewControllerTests.m
//  Omega-Splicer
//
//  Created by Charles-Adrien Fournier on 04/04/16.
//  Copyright © 2016 Charles-Adrien Fournier. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "OSFlyPortraitViewController.h"

@interface OSFlyPortraitViewControllerTests : XCTestCase

@property (strong, nonatomic) OSFlyPortraitViewController *flyPortraitViewController;

@end

@implementation OSFlyPortraitViewControllerTests

- (void)setUp {
    [super setUp];
    self.flyPortraitViewController = [[OSFlyPortraitViewController alloc] init];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testFlyPortraitViewController {
    XCTAssertNotNil(self.flyPortraitViewController, @"Fly portrait view controller is nil");
}

- (void)testMemoryWarning {
    [self.flyPortraitViewController didReceiveMemoryWarning];
}


@end
