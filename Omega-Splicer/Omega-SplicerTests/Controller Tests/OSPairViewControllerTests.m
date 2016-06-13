//
//  OSPairViewControllerTests.m
//  Omega-Splicer
//
//  Created by Charles-Adrien Fournier on 04/04/16.
//  Copyright © 2016 Charles-Adrien Fournier. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "OSPairTableViewController.h"

@interface OSPairViewControllerTests : XCTestCase

@property (strong, nonatomic) OSPairTableViewController *pairViewController;

@end

@implementation OSPairViewControllerTests

- (void)setUp {
    [super setUp];
    self.pairViewController = [[OSPairTableViewController alloc] init];
    [self.pairViewController refresh:nil];
    [self.pairViewController customizeNavigationBar];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testPairViewController {
    XCTAssertNotNil(self.pairViewController, @"Pair view controller is nil");
//    NSIndexPath *myIP = [NSIndexPath indexPathForRow:1 inSection:1];
    [self.pairViewController bluetoothManager:nil didDiscoverPeripheral:nil];
    [self.pairViewController bluetoothManagerIsReadyToScan:false];
    [self.pairViewController bluetoothManager:nil didFailToSetupWithError:nil];
//    [self.pairViewController tableView:self.pairViewController.tableView cellForRowAtIndexPath:nil];
}

- (void)testMemoryWarning {
    [self.pairViewController didReceiveMemoryWarning];
}


@end
